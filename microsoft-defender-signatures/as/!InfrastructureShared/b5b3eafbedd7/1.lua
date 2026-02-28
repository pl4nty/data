local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L2_1 = this_sigattrlog
L2_1 = L2_1[4]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[4]
  L0_1 = L2_1.utf8p2
end
L2_1 = this_sigattrlog
L2_1 = L2_1[5]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[5]
  L1_1 = L2_1.utf8p2
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[6]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[6]
    L1_1 = L2_1.utf8p2
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[7]
    L2_1 = L2_1.matched
    if L2_1 then
      L2_1 = this_sigattrlog
      L2_1 = L2_1[7]
      L1_1 = L2_1.utf8p2
    end
  end
end
if L0_1 ~= nil and L1_1 ~= nil then
  L3_1 = L1_1
  L2_1 = L1_1.match
  L4_1 = "+x [\"]*([^\"]+)"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 == nil or L2_1 == "" then
    L4_1 = L1_1
    L3_1 = L1_1.match
    L5_1 = "777 [\"]*([^\"]+)"
    L3_1 = L3_1(L4_1, L5_1)
    L2_1 = L3_1
  end
  if L2_1 == nil or L2_1 == "" then
    L4_1 = L1_1
    L3_1 = L1_1.match
    L5_1 = "755 [\"]*([^\"]+)"
    L3_1 = L3_1(L4_1, L5_1)
    L2_1 = L3_1
  end
  if L2_1 ~= nil and L2_1 ~= "" then
    L3_1 = string
    L3_1 = L3_1.find
    L4_1 = L0_1
    L5_1 = L2_1
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if L3_1 then
      L3_1 = TrackPidAndTechniqueBM
      L4_1 = "BM"
      L5_1 = "T1222.002"
      L6_1 = "DefenseEvasion_FileAndDirectoryPermissionsModification_Curl"
      L3_1(L4_1, L5_1, L6_1)
      L3_1 = this_sigattrlog
      L3_1 = L3_1[4]
      L3_1 = L3_1.ppid
      if L3_1 then
        L4_1 = MpCommon
        L4_1 = L4_1.BmTriggerSig
        L5_1 = L3_1
        L6_1 = "BM_C2CurlChmodFile"
        L7_1 = L2_1
        L4_1(L5_1, L6_1, L7_1)
      end
      L4_1 = mp
      L4_1 = L4_1.INFECTED
      return L4_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
