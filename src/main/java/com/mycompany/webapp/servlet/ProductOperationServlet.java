/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import com.mycompany.webapp.dao.CategoryDao;
import com.mycompany.webapp.dao.ProductDao;
import com.mycompany.webapp.entities.Category;
import com.mycompany.webapp.entities.Product;
import com.mycompany.webapp.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author sunil
 */
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
           String op =request.getParameter("operation");
           if(op.trim().equals("addcategory")){
               
                String title=request.getParameter("catTitle");
                String description=request.getParameter("catDescription");
                
                Category category = new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);
                CategoryDao categoryDao= new CategoryDao(FactoryProvider.getFactory());
                int CatId=categoryDao.saveCategory(category);
                
                HttpSession httpSession =request.getSession();
                httpSession.setAttribute("message","Category saved successfully");
                response.sendRedirect("admin.jsp");
                return;
            
           }
           else if(op.trim().equals("addproduct"))
           {
              String pName= request.getParameter("pName");
              String pDesc= request.getParameter("pDesc");
              int pPrice=Integer.parseInt(request.getParameter("pPrice"));
              int pDiscount=Integer.parseInt(request.getParameter("pDiscount"));
              int pQuantity=Integer.parseInt(request.getParameter("pQuantity"));
              int catId=Integer.parseInt(request.getParameter("catId"));
              Part part=request.getPart("pPic");
              
              Product p= new Product();
              
              p.setpName(pName);
              p.setpDeec(pDesc);
              p.setpPrice(pPrice);
              p.setpDiscount(pDiscount);
              p.setpQuantity(pQuantity);
              p.setpPhoto(part.getSubmittedFileName());
              
              CategoryDao cdao =new CategoryDao(FactoryProvider.getFactory());
              Category category= cdao.getCategoryById(catId);
              p.setCategory(category); 
              
              ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
              
              pdao.saveProduct(p);
              
              //pic upload
              String path=request.getServletContext().getRealPath("img")+ File.separator+"product"+ File.separator+part.getSubmittedFileName();
              System.out.println(path);
              //uploading code 
              FileOutputStream fos= new FileOutputStream(path);
               InputStream is=part.getInputStream();
              //reading data 
              byte[] data=new byte[is.available()];
              is.read(data);
              
              //writing the data
              
              fos.write(data);
              fos.close();
              
              
              HttpSession httpSession =request.getSession();
              httpSession.setAttribute("message","Product saved successfully");
              response.sendRedirect("admin.jsp");
              return;
               
           }
            
            
           
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
