package com.sdgas.util;

/**
 * Created by 120378 on 2014/8/22.
 */

import com.sdgas.model.User;

/**
 * 用户登录信息判断
 */
public class UserUtil {

    public static boolean checkUserLogIn(User user) {
        return user == null;
    }
}
