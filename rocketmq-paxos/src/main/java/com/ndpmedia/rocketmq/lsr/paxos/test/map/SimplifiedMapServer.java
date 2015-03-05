package com.ndpmedia.rocketmq.lsr.paxos.test.map;

import java.io.IOException;
import java.util.concurrent.ExecutionException;

import com.ndpmedia.rocketmq.lsr.common.Configuration;
import com.ndpmedia.rocketmq.lsr.paxos.replica.Replica;

public class SimplifiedMapServer {
    public static void main(String[] args) throws IOException, InterruptedException,
            ExecutionException {
        if (args.length != 1) {
            usage();
            System.exit(1);
        }
        int localId = Integer.parseInt(args[0]);
        Configuration process = new Configuration();

        Replica replica = new Replica(process, localId, new SimplifiedMapService());

        replica.start();
        System.in.read();
        System.exit(-1);
    }

    private static void usage() {
        System.out.println("Invalid arguments. Usage:\n"
                           + "   " + SimplifiedMapServer.class.getCanonicalName() + " <replicaID>");
    }
}
