USE cockpit;

-- Insert name server list.
INSERT INTO name_server(ip, port) VALUES ('54.173.39.198', 9876);
INSERT INTO name_server(ip, port) VALUES ('54.173.209.191', 9876);


-- Insert IP mapping.
INSERT INTO ip_mapping(inner_ip, public_ip) VALUES ('10.5.36.11',	'54.94.189.195');
INSERT INTO ip_mapping(inner_ip, public_ip) VALUES ('10.1.36.13',	'52.0.2.7');
INSERT INTO ip_mapping(inner_ip, public_ip) VALUES ('10.1.36.10',	'54.173.39.198');
INSERT INTO ip_mapping(inner_ip, public_ip) VALUES ('10.2.36.11',	'54.169.36.156');
INSERT INTO ip_mapping(inner_ip, public_ip) VALUES ('10.3.36.10',	'54.67.33.141');
INSERT INTO ip_mapping(inner_ip, public_ip) VALUES ('10.5.36.10',	'54.94.158.107');
INSERT INTO ip_mapping(inner_ip, public_ip) VALUES ('10.3.36.11',	'54.67.112.198');
INSERT INTO ip_mapping(inner_ip, public_ip) VALUES ('10.1.36.12',	'52.0.87.252');
INSERT INTO ip_mapping(inner_ip, public_ip) VALUES ('10.1.36.11',	'54.173.209.191');
INSERT INTO ip_mapping(inner_ip, public_ip) VALUES ('10.2.36.10',	'54.179.161.99');

INSERT INTO team(id, name) VALUES (1, "TP");
INSERT INTO team(id, name) VALUES (2, "YeahTool");
INSERT INTO team(id, name) VALUES (3, "Facebook");

INSERT INTO cockpit_user(id, username, password, role) VALUES (1, 'root', '320734fbb627d6884a1284acbdaa5db9', 'ROLE_ADMIN');
INSERT INTO cockpit_user(id, username, password, role) VALUES (2, 'xutao', '23dc3038d25ef09f3ad7c0552b40ef9f', 'ROLE_USER');

INSERT INTO team_user_xref(team_id, user_id) VALUES (1, 1);
INSERT INTO team_user_xref(team_id, user_id) VALUES (1, 2);

INSERT INTO topic(topic, broker_address) VALUES ('T_QuickStart', '54.94.212.186:10911');
INSERT INTO topic(topic, broker_address) VALUES ('T_QuickStart', '54.94.203.40:10911');
INSERT INTO topic(topic, broker_address) VALUES ('TopicTest_Robert', '172.30.50.54:10911');
INSERT INTO topic(topic, broker_address) VALUES ('T_PARSER', '172.30.50.54:10911');
INSERT INTO topic(topic, broker_address) VALUES ('T_QuickStart', '172.30.50.54:10911');
INSERT INTO topic(topic, broker_address) VALUES ('T_QuickStart', '172.30.50.54:10911');

INSERT INTO consumer_group(group_name, broker_address, broker_id) VALUES ('CG_QuickStart', '54.94.212.186:10911', 0);
INSERT INTO consumer_group(group_name, broker_address, broker_id) VALUES ('CG_QuickStart', '172.30.50.54:10911', 0);
INSERT INTO consumer_group(group_name, broker_address, broker_id) VALUES ('C_GKT_MQ_GROUP', '172.30.50.54:10911', 0);

INSERT INTO name_server_kv(id, name_space, `key`, `value`, status_id) VALUES (NULL , "DC_SELECTOR", "DC_DISPATCH_STRATEGY", "BY_RATIO", 2);
INSERT INTO name_server_kv(id, name_space, `key`, `value`, status_id) VALUES (NULL , "DC_SELECTOR", "DC_DISPATCH_RATIO", "1:0.25,2:0.3,3:0.25,5:0.2", 2);
