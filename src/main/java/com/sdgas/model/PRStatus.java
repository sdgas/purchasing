package com.sdgas.model;

/**
 * 请购单状态
 * Created by 120378 on 2014/7/15.
 */
public enum PRStatus {

    /**
     * 申请
     */
    PR {
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
     * 分管领导（副总经理）
     */
    LEADER {
        public int getStatus() {
            return 2;
        }
    },
    /**
     * 总经理
     */
    GM {
        public int getStatus() {
            return 3;
        }
    },
    /**
     * 取消
     */
    CANCEL {
        public int getStatus() {
            return 4;
        }
    },
    /**
     * 采购
     */
    PU {
        public int getStatus() {
            return 5;
        }
    },
    /**
     * 需求结束
     */
    DEMAND {
        public int getStatus() {
            return 6;
        }
    };

    public abstract int getStatus();

    @Override
    public String toString() {
        switch (this) {
            case PR:
                return "申请";
            case HEAD:
                return "部门负责人";
            case LEADER:
                return "分管领导";
            case GM:
                return "总经理";
            case CANCEL:
                return "取消";
            case PU:
                return "采购";
            case DEMAND:
                return "需求结束";
            default:
                return "Error";
        }
    }

}
