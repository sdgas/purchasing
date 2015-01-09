package com.sdgas.model;

/**
 * Created by 120378 on 2014/9/2.
 */
public enum OrderStatus {
    /**
     * 采购
     */
    PU {
        public int getStatus() {
            return 0;
        }
    },
    /**
     * 部门负责人（经理）
     */
    HEAD {
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
    },
    /**
     * 完成
     */
    DONE {
        public int getStatus() {
            return 3;
        }
    };

    public abstract int getStatus();

    @Override
    public String toString() {
        switch (this) {
            case PU:
                return "申请";
            case HEAD:
                return "部门负责人";
            case CANCEL:
                return "取消";
            case DONE:
                return "完成";
            default:
                return "Error";
        }
    }

}
