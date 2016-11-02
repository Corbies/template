package com.lew.jlight.core;

import java.util.concurrent.atomic.AtomicInteger;

public class IdGenerator {
    private  AtomicInteger count = new AtomicInteger(0);
    private final static int maxCount = 999;

    private IdGenerator() {

    }

    public static IdGenerator getInstance() {
        return GeneratorInstance.idGenerator;
    }

    public  String getStringId() {
        if (count.incrementAndGet() == maxCount) {
            count.compareAndSet(maxCount, 0);
        }
        long id = System.currentTimeMillis() + count.incrementAndGet();
        return String.valueOf(id);
    }

    public  long getLongId() {
        if (count.incrementAndGet() == maxCount) {
            count.compareAndSet(maxCount, 0);
        }
        long id = System.currentTimeMillis() + count.incrementAndGet();
        return id;
    }

    private static class GeneratorInstance {
        public static IdGenerator idGenerator = new IdGenerator();
    }

}
