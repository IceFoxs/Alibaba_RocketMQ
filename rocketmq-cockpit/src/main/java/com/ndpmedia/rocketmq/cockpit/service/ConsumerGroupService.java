package com.ndpmedia.rocketmq.cockpit.service;

import com.ndpmedia.rocketmq.cockpit.model.ConsumerGroup;

public interface ConsumerGroupService {

    boolean update(ConsumerGroup consumerGroup);

    void insert(ConsumerGroup consumerGroup, long teamId);
}
