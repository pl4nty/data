-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\109b308197973\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[5]).matched or (this_sigattrlog[5]).utf8p1 == nil then
  return mp.CLEAN
end
if not IsBasToolProcessForPpid("BM", "Picus") and not IsBasToolProcessFoundInParents("BM", "Picus", 4) then
  return mp.CLEAN
end
local l_0_0 = (this_sigattrlog[5]).utf8p1
;
(bm.add_threat_file)(l_0_0)
;
(bm.add_related_string)("picus_temp_dll", (string.lower)(l_0_0), bm.RelatedStringBMReport)
add_parents()
TrackPidAndTechniqueBM("BM", "T1574.001", "picus_signed_binary_temp_dll")
return mp.INFECTED

