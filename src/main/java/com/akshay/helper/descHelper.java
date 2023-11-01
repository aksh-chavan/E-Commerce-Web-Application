
package com.akshay.helper;

import java.util.HashMap;
import java.util.Map;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class descHelper {
    public static String get10Words(String desc)
    {
        String[] strs = desc.split(" ");
        
        if(strs.length > 10)
        {
            String result = "";
            for(int i=0; i<10; i++)
            {
                result = result + strs[i] + " ";
            }
            return (result+"...");
        }   
         else
        {
                return (desc+"...");
        }
        
    }
    
    public static Map<String,Long> getCounts(SessionFactory factory)
    {
        Session session = factory.openSession();
        String q1 = "select count(*) from User";
        String q2 = "select count(*) from User";
        
        Query query1 = session.createQuery(q1);
        Query query2 = session.createQuery(q2);
        
        Long userCount = (Long)query1.getResultList().get(0);
        Long productCount = (Long)query2.getResultList().get(0);
        
        Map<String,Long> map=new HashMap<>();
        map.put("userCount", userCount);
        map.put("productCount", productCount);
        
        session.close();
        
        return map;
    }
    
}
