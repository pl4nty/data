-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\847b3887f0d1f\0x0000c3bb_luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
local l_0_1 = false
local l_0_2 = false
if is_excluded_parent_proc_auto() then
  return mp.CLEAN
end
if IsLegacyOrgMachine() or IsTechniqueObservedForPid("BM", "ttexclusion") or IsTacticObservedForPid("BM", "ttexclusion") or IsTacticObservedForPid("BM", "ttexclusion_cln") then
  return mp.CLEAN
end
if (bm.GetSignatureMatchDuration)() > 300000000 then
  return mp.CLEAN
end
if (this_sigattrlog[45]).matched then
  l_0_0 = parseNetworkVolumeEvent(this_sigattrlog[45])
else
  if (this_sigattrlog[46]).matched then
    l_0_0 = parseNetworkVolumeEvent(this_sigattrlog[46])
    l_0_1 = true
  end
end
if l_0_0 and #l_0_0 < 0 then
  return mp.CLEAN
end
if tonumber(l_0_0.Bout) < 100000 then
  return mp.CLEAN
end
local l_0_3 = (bm.GetOverallTrafficVolumes)()
-- DECOMPILER ERROR at PC89: Unhandled construct in 'MakeBoolean' P1

if l_0_1 and l_0_3["incoming_response "] > 10000000 then
  l_0_2 = true
end
if l_0_3.outgoing_req > 10000000 then
  l_0_2 = true
end
if l_0_2 then
  add_parents()
  reportRelatedBmHits()
  addOverallNetworkVolume()
  TrackPidAndTechniqueBM("BM", "T1567", "ExfilOverWeb")
  reportSessionInformation()
  return mp.INFECTED
end
return mp.CLEAN

