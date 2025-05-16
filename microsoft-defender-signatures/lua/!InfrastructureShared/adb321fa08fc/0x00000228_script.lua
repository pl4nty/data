-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\adb321fa08fc\0x00000228_luac 

-- params : ...
-- function num : 0
local l_0_0 = GetRollingQueueKeysAsString("TT_ModifiedServices", "|")
if l_0_0 then
  (bm.add_related_string)("TT_ModifiedServices", l_0_0, bm.RelatedStringBMReport)
  TrackPidAndTechniqueBM("BM", "T1489", "mass_service_stop")
  return mp.INFECTED
end
return mp.CLEAN

