-- Threat: !InfrastructureShared
-- Name: 164b3afe6c40a
-- Type: 21

pcall(MpCommon.AtomicCounterSet, "DirtyFragRxRPC-Burst", 1, 3)
return mp.CLEAN
