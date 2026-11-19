-- Threat: !InfrastructureShared
-- Name: 207b3c6382d59
-- Type: 21

pcall(MpCommon.AtomicCounterSet, "linux_ssh_tmp_benign_active", 1, 900)
return mp.CLEAN
