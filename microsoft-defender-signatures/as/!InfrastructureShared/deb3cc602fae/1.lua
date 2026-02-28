local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = nil
L2_1 = nil
L3_1 = this_sigattrlog
L3_1 = L3_1[2]
L3_1 = L3_1.matched
if L3_1 then
  L3_1 = this_sigattrlog
  L3_1 = L3_1[2]
  if L3_1 ~= nil then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[2]
    if L3_1 ~= "" then
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = this_sigattrlog
      L4_1 = L4_1[2]
      L4_1 = L4_1.utf8p1
      L3_1 = L3_1(L4_1)
      L1_1 = L3_1
  end
end
else
  L3_1 = this_sigattrlog
  L3_1 = L3_1[3]
  L3_1 = L3_1.matched
  if L3_1 then
    L3_1 = this_sigattrlog
    L3_1 = L3_1[3]
    if L3_1 ~= nil then
      L3_1 = this_sigattrlog
      L3_1 = L3_1[3]
      if L3_1 ~= "" then
        L3_1 = string
        L3_1 = L3_1.lower
        L4_1 = this_sigattrlog
        L4_1 = L4_1[3]
        L4_1 = L4_1.utf8p1
        L3_1 = L3_1(L4_1)
        L1_1 = L3_1
      end
    end
  end
end
if L1_1 == nil or L1_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = 1
L4_1 = L0_1
L5_1 = 1
for L6_1 = L3_1, L4_1, L5_1 do
  L7_1 = sigattr_tail
  L7_1 = L7_1[L6_1]
  L7_1 = L7_1.attribute
  if L7_1 == 16384 then
    L7_1 = sigattr_tail
    L7_1 = L7_1[L6_1]
    L7_1 = L7_1.utf8p1
    L8_1 = L7_1
    L7_1 = L7_1.lower
    L7_1 = L7_1(L8_1)
    L2_1 = L7_1
    if L2_1 == L1_1 then
      L7_1 = mp
      L7_1 = L7_1.CLEAN
      return L7_1
    end
  end
end
L3_1 = TrackPidAndTechniqueBM
L4_1 = "BM"
L5_1 = "T1647"
L6_1 = "DefenseEvasion_PlistFileModification"
L3_1(L4_1, L5_1, L6_1)
L3_1 = mp
L3_1 = L3_1.set_mpattribute
L4_1 = "BM_PlistModification"
L3_1(L4_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
