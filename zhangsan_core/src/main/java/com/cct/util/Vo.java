package com.cct.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Vo<T> {
    private int code;
    private String msg;
    private T data;

    public Vo(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
