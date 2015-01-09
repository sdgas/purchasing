package com.sdgas.model;

/**
 * 申请材料的状态
 * Created by 120378 on 2014/7/15.
 */
public enum FormStatus {

    /**
     * 需求
     */
    DEMAND {
        public int getStatus() {
            return 0;
        }
    },
    /**
     * 请购
     */
    REQUISITION {
        public int getStatus() {
            return 1;
        }
    },
    /**
     * 取消
     */
    CANCEL {
        public int getStatus() {
            return 2;
        }
    };

    public abstract int getStatus();

    @Override
    public String toString() {
        switch (this) {
            case DEMAND:
                return "需求";
            case REQUISITION:
                return "请购";
            case CANCEL:
                return "取消";
            default:
                return "Error";
        }
    }
}
