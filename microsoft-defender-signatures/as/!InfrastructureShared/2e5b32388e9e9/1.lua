local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L0_1 = L1_1.utf8p2
  end
end
if L0_1 ~= nil then
  L1_1 = extractDllForRegproc
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L2_1 = checkFileLastWriteTime
    L3_1 = L1_1
    L4_1 = 600
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 == false then
      L2_1 = mp
      L2_1 = L2_1.IsKnownFriendlyFile
      L3_1 = L1_1
      L4_1 = true
      L5_1 = false
      L2_1 = L2_1(L3_1, L4_1, L5_1)
      if L2_1 == false then
        L2_1 = bm
        L2_1 = L2_1.add_threat_file
        L3_1 = L1_1
        L2_1(L3_1)
        L2_1 = mp
        L2_1 = L2_1.INFECTED
        return L2_1
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
