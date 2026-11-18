-- Threat: !InfrastructureShared
-- Name: 217b3d3b318db
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0
local l_0_1 = {
  "program files",
  "windows"
}
local l_0_2 = {}
local l_0_3 = false
local l_0_4 = false
if this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[9].utf8p1
end
if contains(l_0_0, l_0_1) then
  return mp.CLEAN
end
if IsLegacyOrgMachine() or IsTechniqueObservedForPid("BM", "ttexclusion") or IsTacticObservedForPid("BM", "ttexclusion") or IsTacticObservedForPid("BM", "ttexclusion_cln") then
  return mp.CLEAN
end
if this_sigattrlog[11].matched then
  l_0_2 = parseNetworkVolumeEvent(this_sigattrlog[11])
elseif this_sigattrlog[12].matched then
  l_0_2 = parseNetworkVolumeEvent(this_sigattrlog[12])
  l_0_3 = true
end
if l_0_2 and #l_0_2 < 0 then
  return mp.CLEAN
end
if tonumber(l_0_2.Bout) < 100000 then
  return mp.CLEAN
end
local l_0_5 = bm.GetOverallTrafficVolumes()
if l_0_3 then
  if l_0_5["incoming_response "] > 10000000 then
    l_0_4 = true
  end
elseif 10000000 < l_0_5.outgoing_req then
  l_0_4 = true
end
if l_0_4 then
  add_parents()
  reportRelatedBmHits()
  addOverallNetworkVolume()
  TrackPidAndTechniqueBM("BM", "T1567", "ExfilOverWeb")
  return mp.INFECTED
end
return mp.CLEAN
