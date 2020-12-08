package utils;

import org.apache.commons.beanutils.BeanUtils;

import java.util.Map;

/**
 * @author ����ܿ
 */

//��װ��ΪBeanUtils��ز���

public class WebUtils {
    /**
     * ��Map�е�ֵע�뵽��Ӧ��JavaBean�����С�
     * @param value
     * @param bean
     */
    public static <T> T copyParamToBean(Map value , T bean ){
        try {
            /**
             * ����������Ĳ�����ע�뵽user������
             */
            BeanUtils.populate(bean, value);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bean;
    }

    /**
     * ���ַ���ת����Ϊint���͵�����
     * @param strInt
     * @param defaultValue
     * @return
     */
    public static int parseInt(String strInt,int defaultValue) {
        try {
            return Integer.parseInt(strInt);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return defaultValue;
    }
}