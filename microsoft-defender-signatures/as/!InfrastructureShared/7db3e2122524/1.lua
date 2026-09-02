-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\7db3e2122524\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[2]).matched then
  return mp.CLEAN
end
if not IsBasToolProcessForPpid("BM", "Picus") and not IsBasToolProcessFoundInParents("BM", "Picus", 4) then
  return mp.CLEAN
end
local l_0_0 = (this_sigattrlog[2]).utf8p2
if l_0_0 ~= nil then
  (bm.add_related_string)("picus_firewall_disable", (string.lower)(l_0_0), bm.RelatedStringBMReport)
end
add_parents()
TrackPidAndTechniqueBM("BM", "T1562.004", "picus_firewall_disable")
return mp.INFECTED

