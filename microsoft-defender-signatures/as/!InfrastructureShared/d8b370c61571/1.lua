-- Threat: !InfrastructureShared
-- Name: d8b370c61571
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, TechniqueTracker

local l_0_0
local l_0_1 = {
  "program files",
  "windows"
}
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if contains(l_0_0, l_0_1) then
  return mp.CLEAN
end
if IsLegacyOrgMachine() or IsTechniqueObservedForPid("BM", "ttexclusion") or IsTacticObservedForPid("BM", "ttexclusion") or IsTacticObservedForPid("BM", "ttexclusion_cln") then
  return mp.CLEAN
end
local l_0_2 = bm.GetOverallTrafficVolumes()
if l_0_2.incoming_req < 1500000 and 1500000 > l_0_2.outgoing_req and 1500000 > l_0_2.incoming_response and 1500000 > l_0_2.outgoing_response then
  return mp.CLEAN
end
local l_0_3 = math_abs(l_0_2.incoming_req - l_0_2.outgoing_req)
local l_0_4 = math_abs(l_0_2.incoming_response - l_0_2.outgoing_response)
if 0 <= l_0_3 and l_0_3 <= 100000 or 0 <= l_0_4 and l_0_4 <= 100000 then
  add_parents()
  reportRelatedBmHits()
  addOverallNetworkVolume()
  reportSessionInformation()
  TrackPidAndTechniqueBM("BM", "T1090", "MultiProxy")
  return mp.INFECTED
end
return mp.CLEAN
