local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L1_1 = {}
L2_1 = false
L3_1 = false
L4_1 = {}
L5_1 = "program files"
L6_1 = "windows"
L4_1[1] = L5_1
L4_1[2] = L6_1
L5_1 = this_sigattrlog
L5_1 = L5_1[2]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = this_sigattrlog
  L5_1 = L5_1[2]
  L5_1 = L5_1.utf8p1
  if L5_1 ~= nil then
    L5_1 = this_sigattrlog
    L5_1 = L5_1[2]
    L0_1 = L5_1.utf8p1
  end
end
L5_1 = contains
L6_1 = L0_1
L7_1 = L4_1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = IsLegacyOrgMachine
L5_1 = L5_1()
if not L5_1 then
  L5_1 = IsTechniqueObservedForPid
  L6_1 = "BM"
  L7_1 = "ttexclusion"
  L5_1 = L5_1(L6_1, L7_1)
  if not L5_1 then
    L5_1 = IsTacticObservedForPid
    L6_1 = "BM"
    L7_1 = "ttexclusion"
    L5_1 = L5_1(L6_1, L7_1)
    if not L5_1 then
      L5_1 = IsTacticObservedForPid
      L6_1 = "BM"
      L7_1 = "ttexclusion_cln"
      L5_1 = L5_1(L6_1, L7_1)
      if not L5_1 then
        goto lbl_55
      end
    end
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_55::
L5_1 = this_sigattrlog
L5_1 = L5_1[8]
L5_1 = L5_1.matched
if L5_1 then
  L5_1 = parseNetworkVolumeEvent
  L6_1 = this_sigattrlog
  L6_1 = L6_1[8]
  L5_1 = L5_1(L6_1)
  L1_1 = L5_1
else
  L5_1 = this_sigattrlog
  L5_1 = L5_1[9]
  L5_1 = L5_1.matched
  if L5_1 then
    L5_1 = parseNetworkVolumeEvent
    L6_1 = this_sigattrlog
    L6_1 = L6_1[9]
    L5_1 = L5_1(L6_1)
    L1_1 = L5_1
    L2_1 = true
  end
end
if L1_1 then
  L5_1 = #L1_1
  if L5_1 < 0 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
end
L5_1 = tonumber
L6_1 = L1_1.Bout
L5_1 = L5_1(L6_1)
if L5_1 < 100000 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = bm
L5_1 = L5_1.GetOverallTrafficVolumes
L5_1 = L5_1()
if L2_1 then
  L6_1 = L5_1["incoming_response "]
  if 10000000 < L6_1 then
    L3_1 = true
  end
else
  L6_1 = L5_1.outgoing_req
  if 10000000 < L6_1 then
    L3_1 = true
  end
end
if L3_1 then
  L6_1 = add_parents
  L6_1()
  L6_1 = reportRelatedBmHits
  L6_1()
  L6_1 = addOverallNetworkVolume
  L6_1()
  L6_1 = reportSessionInformation
  L6_1()
  L6_1 = TrackPidAndTechniqueBM
  L7_1 = "BM"
  L8_1 = "T1567"
  L9_1 = "ExfilOverWeb"
  L6_1(L7_1, L8_1, L9_1)
  L6_1 = mp
  L6_1 = L6_1.INFECTED
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.CLEAN
return L6_1
