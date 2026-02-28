local L0_1, L1_1, L2_1, L3_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.utf8p2
  if L0_1 then
    L0_1 = safeJsonDeserialize
    L1_1 = this_sigattrlog
    L1_1 = L1_1[2]
    L1_1 = L1_1.utf8p2
    L0_1 = L0_1(L1_1)
    L1_1 = isnull
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    if not L1_1 then
      L1_1 = isnull
      L2_1 = L0_1.rename_ext
      L1_1 = L1_1(L2_1)
      if not L1_1 then
        L1_1 = L0_1.rename_ext
        L2_1 = L1_1
        L1_1 = L1_1.lower
        L1_1 = L1_1(L2_1)
        L2_1 = {}
        L2_1[".loop"] = true
        L3_1 = L2_1[L1_1]
        if L3_1 == true then
          L3_1 = mp
          L3_1 = L3_1.INFECTED
          return L3_1
        end
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
