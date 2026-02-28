local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.utf8p1
L1_1 = {}
L1_1[".exe"] = true
L1_1[".dll"] = true
L3_1 = L0_1
L2_1 = L0_1.sub
L4_1 = -4
L2_1 = L2_1(L3_1, L4_1)
L3_1 = L1_1[L2_1]
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = sysio
L3_1 = L3_1.IsFileExists
L4_1 = L0_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.IsKnownFriendlyFile
  L4_1 = L0_1
  L5_1 = false
  L6_1 = false
  L3_1 = L3_1(L4_1, L5_1, L6_1)
  if L3_1 == false then
    L3_1 = bm
    L3_1 = L3_1.add_related_file
    L4_1 = L0_1
    L3_1(L4_1)
    L3_1 = {}
    L4_1 = table
    L4_1 = L4_1.insert
    L5_1 = L3_1
    L6_1 = L0_1
    L4_1(L5_1, L6_1)
    L4_1 = MpCommon
    L4_1 = L4_1.SetPersistContextNoPath
    L5_1 = "ServiceBinHijack"
    L6_1 = L3_1
    L7_1 = 3600
    L4_1(L5_1, L6_1, L7_1)
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
