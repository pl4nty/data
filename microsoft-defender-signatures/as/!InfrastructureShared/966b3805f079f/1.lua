-- Threat: !InfrastructureShared
-- Name: 966b3805f079f
-- Type: 21

pcall(MpCommon.AtomicCounterSet, "linux_pkg_maintenance_active", 1, 900)
return mp.CLEAN
