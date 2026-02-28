local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = {}
L1_1 = false
L2_1 = false
L3_1 = is_excluded_parent_proc_auto
L3_1 = L3_1()
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = IsLegacyOrgMachine
L3_1 = L3_1()
if not L3_1 then
  L3_1 = IsTechniqueObservedForPid
  L4_1 = "BM"
  L5_1 = "ttexclusion"
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L3_1 = IsTacticObservedForPid
    L4_1 = "BM"
    L5_1 = "ttexclusion"
    L3_1 = L3_1(L4_1, L5_1)
    if not L3_1 then
      L3_1 = IsTacticObservedForPid
      L4_1 = "BM"
      L5_1 = "ttexclusion_cln"
      L3_1 = L3_1(L4_1, L5_1)
      if not L3_1 then
        goto lbl_36
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_36::
L3_1 = bm
L3_1 = L3_1.GetSignatureMatchDuration
L3_1 = L3_1()
if 300000000 < L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = this_sigattrlog
L3_1 = L3_1[45]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = parseNetworkVolumeEvent
  L4_1 = this_sigattrlog
  L4_1 = L4_1[45]
  L3_1 = L3_1(L4_1)
  L0_1 = L3_1
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[46]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = parseNetworkVolumeEvent
    L4_1 = this_sigattrlog
    L4_1 = L4_1[46]
    L3_1 = L3_1(L4_1)
    L0_1 = L3_1
    L1_1 = true
  end
end
if L0_1 then
  L3_1 = #L0_1
  if L3_1 < 0 then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
end
L3_1 = tonumber
L4_1 = L0_1.Bout
L3_1 = L3_1(L4_1)
if L3_1 < 100000 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = bm
L3_1 = L3_1.GetOverallTrafficVolumes
L3_1 = L3_1()
if L1_1 then
  L4_1 = L3_1["incoming_response "]
  if 10000000 < L4_1 then
    L2_1 = true
  end
else
  L4_1 = L3_1.outgoing_req
  if 10000000 < L4_1 then
    L2_1 = true
  end
end
if L2_1 then
  L4_1 = add_parents
  L4_1()
  L4_1 = reportRelatedBmHits
  L4_1()
  L4_1 = addOverallNetworkVolume
  L4_1()
  L4_1 = TrackPidAndTechniqueBM
  L5_1 = "BM"
  L6_1 = "T1567"
  L7_1 = "ExfilOverWeb"
  L4_1(L5_1, L6_1, L7_1)
  L4_1 = reportSessionInformation
  L4_1()
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
