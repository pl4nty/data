-- Threat: !InfrastructureShared
-- Name: 1abb325834a6f
-- Type: 21

pcall(MpCommon.AtomicCounterSet, "linux_config_mgmt_active", 1, 900)
return mp.CLEAN
