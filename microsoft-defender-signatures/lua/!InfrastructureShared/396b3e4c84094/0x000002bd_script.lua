-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\396b3e4c84094\0x000002bd_luac 

-- params : ...
-- function num : 0
TrackPidAndTechniqueBM("BM", "T1647", "DefenseEvasion_DefaultsPlistFileModification")
;
(mp.set_mpattribute)("BM_PlistModUsingDefaults")
return mp.INFECTED

