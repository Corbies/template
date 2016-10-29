package com.lew.jlight.web.util;


import com.google.common.base.Strings;

public abstract class UserContextUtil {


    public static void clearSessionValueObject() {
        String token = getToken();
        CookieUtil.removeCookie("", null, null, false);
        //clear data from cache
    }

    private static String getToken() {
        //get token from cache
        return CookieUtil.getCookieByName("", null, null);
    }
}
