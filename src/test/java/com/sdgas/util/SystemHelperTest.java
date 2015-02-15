package com.sdgas.util;

import org.junit.Assert;
import org.junit.Test;

import java.net.InetAddress;

import static org.junit.Assert.*;

public class SystemHelperTest {

    @Test
    public void testGetSystemLocalIp() throws Exception {
        InetAddress ip = SystemHelper.getSystemLocalIp();
        Assert.assertEquals("10.48.1.151", ip.getHostAddress());
    }

    @Test
    public void testGetSystemOSName() throws Exception {

    }

    @Test
    public void testGetPropertery() throws Exception {

    }

    @Test
    public void testGetRAMinfo() throws Exception {

    }
}