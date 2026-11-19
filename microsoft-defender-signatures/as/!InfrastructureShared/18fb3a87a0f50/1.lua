-- Threat: !InfrastructureShared
-- Name: 18fb3a87a0f50
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
local l_0_1 = {}
local l_0_2 = false
local l_0_3 = false
local l_0_4 = {
  "program files",
  "windows"
}
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if contains(l_0_0, l_0_4) then
  return mp.CLEAN
end
if IsLegacyOrgMachine() or IsTechniqueObservedForPid("BM", "ttexclusion") or IsTacticObservedForPid("BM", "ttexclusion") or IsTacticObservedForPid("BM", "ttexclusion_cln") then
  return mp.CLEAN
end
if this_sigattrlog[8].matched then
  l_0_1 = parseNetworkVolumeEvent(this_sigattrlog[8])
elseif this_sigattrlog[9].matched then
  l_0_1 = parseNetworkVolumeEvent(this_sigattrlog[9])
  l_0_2 = true
end
if l_0_1 and #l_0_1 < 0 then
  return mp.CLEAN
end
if tonumber(l_0_1.Bout) < 100000 then
  return mp.CLEAN
end
local l_0_5 = bm.GetOverallTrafficVolumes()
if l_0_2 then
  if l_0_5["incoming_response "] > 10000000 then
    l_0_3 = true
  end
elseif 10000000 < l_0_5.outgoing_req then
  l_0_3 = true
end
if l_0_3 then
  add_parents()
  reportRelatedBmHits()
  addOverallNetworkVolume()
  reportSessionInformation()
  TrackPidAndTechniqueBM("BM", "T1567", "ExfilOverWeb")
  return mp.INFECTED
end
return mp.CLEAN
