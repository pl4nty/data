local L0_1, L1_1, L2_1, L3_1
L0_1 = this_sigattrlog
L0_1 = L0_1[6]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[6]
  L0_1 = L0_1.utf8p2
  if L0_1 ~= nil then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[6]
    L0_1 = L0_1.utf8p2
    L1_1 = L0_1
    L0_1 = L0_1.match
    L2_1 = "filepath:([^;]+);?"
    L0_1 = L0_1(L1_1, L2_1)
    if not L0_1 then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
    L1_1 = sysio
    L1_1 = L1_1.IsFileExists
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    if L1_1 then
      L1_1 = bm
      L1_1 = L1_1.add_threat_file
      L2_1 = L0_1
      L1_1(L2_1)
    end
    L1_1 = AddResearchData
    L2_1 = "BM"
    L3_1 = true
    L1_1(L2_1, L3_1)
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
