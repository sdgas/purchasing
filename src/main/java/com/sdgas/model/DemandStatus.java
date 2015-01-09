package com.sdgas.model;

/**
 * 需求计划状态
 * Created by 120378 on 2014/7/15.
 */
public enum DemandStatus {

    /**
     * 申请
     */
    APPLY {
        public int getStatus() {
            return 0;
        }
    },
    /**
     * 部门负责人
     */
    HEAD {
        public int getStatus() {
            return 1;
        }
    },
    /**
     * 分管领导
     */
    LEADER {
        public int getStatus() {
            return 2;
        }
    },
    /**
     * 请购
     */
    PR {
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
    };

    public abstract int getStatus();

    @Override
    public String toString() {
        switch (this) {
            case APPLY:
                return "申请";
            case HEAD:
                return "部门负责人";
            case LEADER:
                return "分管领导";
            case CANCEL:
                return "取消";
            case PR:
                return "请购";
            default:
                return "Error";
        }
    }

}
