package org.issac.orderAppTest.dao;

import org.junit.jupiter.api.Test;
import org.issac.orderTest.bean.User;
import org.issac.orderTest.util.Passport;

import static org.junit.jupiter.api.Assertions.*;

class UserDaoImplTest {

    @Test
    void findByLoginNameAndPass() {
        UserDaoImpl userDao = new UserDaoImpl();
        User user;
        user=userDao.findByLoginNameAndPass("ces","111111");
        System.out.println("username  "+user.getLoginName()+
                "  userPassword  "+user.getPassword());
    }

    @Test
    void findByLoginName() {
        UserDaoImpl userDao = new UserDaoImpl();
        User user;
        user=userDao.findByLoginName("admin");
        System.out.println("username  "+user.getLoginName()+
                "  userPassword  "+user.getPassword());
    }

    @Test
    void save() {
        UserDaoImpl userDao= new UserDaoImpl();
        User user = new User();
        user.setLoginName("ces");
        user.setPassword("111111");
        user.setEmail("1022829@qq.com");
        user.setPhone("13539902243");
        userDao.save(user);

    }
    @Test
    void  tomd5() {
        String key = "isaac";
        Passport passport = new Passport();
        //User user = new User();
        //user.setPassword("mlllll");
        String md5pass = passport.md5("111");
        System.out.println(md5pass);

    }
    @Test
    void  md5to() {
        String key = "isaac";
        Passport passport = new Passport();
        //User user = new User();
        //user.setPassword("mlllll");
        String md5pass = passport.passport_decrypt("C2oHaVM2CWYHP1Q5",key);
        System.out.println(md5pass);

    }
}