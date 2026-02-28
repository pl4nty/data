local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L1_1 = {}
L2_1 = "program files"
L3_1 = "windows"
L1_1[1] = L2_1
L1_1[2] = L3_1
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[2]
    L0_1 = L2_1.utf8p1
  end
end
L2_1 = contains
L3_1 = L0_1
L4_1 = L1_1
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = IsLegacyOrgMachine
L2_1 = L2_1()
if not L2_1 then
  L2_1 = IsTechniqueObservedForPid
  L3_1 = "BM"
  L4_1 = "ttexclusion"
  L2_1 = L2_1(L3_1, L4_1)
  if not L2_1 then
    L2_1 = IsTacticObservedForPid
    L3_1 = "BM"
    L4_1 = "ttexclusion"
    L2_1 = L2_1(L3_1, L4_1)
    if not L2_1 then
      L2_1 = IsTacticObservedForPid
      L3_1 = "BM"
      L4_1 = "ttexclusion_cln"
      L2_1 = L2_1(L3_1, L4_1)
      if not L2_1 then
        goto lbl_52
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_52::
L2_1 = bm
L2_1 = L2_1.GetOverallTrafficVolumes
L2_1 = L2_1()
L3_1 = L2_1.incoming_req
if L3_1 < 1500000 then
  L3_1 = L2_1.outgoing_req
  if L3_1 < 1500000 then
    L3_1 = L2_1.incoming_response
    if L3_1 < 1500000 then
      L3_1 = L2_1.outgoing_response
      if L3_1 < 1500000 then
        L3_1 = mp
        L3_1 = L3_1.CLEAN
        return L3_1
      end
    end
  end
end
L3_1 = math_abs
L4_1 = L2_1.incoming_req
L5_1 = L2_1.outgoing_req
L4_1 = L4_1 - L5_1
L3_1 = L3_1(L4_1)
L4_1 = math_abs
L5_1 = L2_1.incoming_response
L6_1 = L2_1.outgoing_response
L5_1 = L5_1 - L6_1
L4_1 = L4_1(L5_1)
if 0 <= L3_1 and L3_1 <= 100000 or 0 <= L4_1 and L4_1 <= 100000 then
  L5_1 = add_parents
  L5_1()
  L5_1 = reportRelatedBmHits
  L5_1()
  L5_1 = addOverallNetworkVolume
  L5_1()
  L5_1 = reportSessionInformation
  L5_1()
  L5_1 = TrackPidAndTechniqueBM
  L6_1 = "BM"
  L7_1 = "T1090"
  L8_1 = "MultiProxy"
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
