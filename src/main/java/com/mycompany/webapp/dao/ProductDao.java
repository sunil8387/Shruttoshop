/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.webapp.dao;

import com.mycompany.webapp.entities.Cart;
import com.mycompany.webapp.entities.Product;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author sunil
 */
public class ProductDao {
     private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory=factory;
    }
    public boolean saveProduct(Product product){
        boolean f= false;
        try{
           Session session= this.factory.openSession();
           Transaction tx= session.beginTransaction();
           
           session.save(product);
           
           
            
            tx.commit();
            session.close();
            f=true;
        }
        catch(Exception e){
            e.printStackTrace();
            f=false;
        }
        return f;
    }
    
    
    //get all products
    public List<Product> getAllProducts(){
        Session s=this.factory.openSession();
        Query query=s.createQuery("from Product");
        List<Product> list=query.list();
        return list;
    }
    //get all products of given category
    public List<Product> getAllProductsById(int cid){
        Session s=this.factory.openSession();
        Query query=s.createQuery("from Product as p where p.category.categoryId=: id");
        query.setParameter("id",cid);
        List<Product> list=query.list();
        return list;
    }
    
    
    public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
        List<Cart> list = new ArrayList<>();
        try (Session session = this.factory.openSession()) {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    Query<Product> query = session.createQuery("from Product as p where p.pId = :id", Product.class);
                    query.setParameter("id", item.getpId());
                    Product product = query.uniqueResult();
                    if (product != null) {
                        Cart cartItem = new Cart();
                        cartItem.setpId(product.getpId());
                        cartItem.setpName(product.getpName());
                        cartItem.setpDeec(product.getpDeec());
                        cartItem.setpPhoto(product.getpPhoto());
                        cartItem.setpDiscount(product.getpDiscount());
                        cartItem.setpQuantity(product.getpQuantity());
                        cartItem.setpPrice(product.getpPrice());
                        cartItem.setQuantity(item.getQuantity());
                        list.add(cartItem);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }
    
    public double getTotalCartPrice(ArrayList<Cart> cartList) {
        double sum = 0;
        try (Session session = this.factory.openSession()) {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    String hql = "from Product p where p.pId = :id";
                    Query<Product> query = session.createQuery(hql, Product.class);
                    query.setParameter("id", item.getpId());
                    Product product = query.uniqueResult();
                    if (product != null) {
                        int priceAfterDiscount = product.getPriceAfterApplyingDiscount();
                        sum += priceAfterDiscount * item.getQuantity();
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return sum;
    }
}
