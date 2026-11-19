-- Threat: !InfrastructureShared
-- Name: 129b39e08cdcf
-- Type: 21

pcall(MpCommon.AtomicCounterSet, "linux_emr_instance_controller_active", 1, 900)
return mp.CLEAN
