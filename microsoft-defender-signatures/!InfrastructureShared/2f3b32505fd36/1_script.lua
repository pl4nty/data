-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2f3b32505fd36\1_luac 

-- params : ...
-- function num : 0
(mp.set_mpattribute)("BM_ClearSysLog")
TrackPidAndTechniqueBM("BM", "T1070.002", "DefenseEvasion_IndicatorRemoval_LogErase")
return mp.INFECTED

