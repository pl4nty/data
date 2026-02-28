local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = this_sigattrlog
L0_1 = L0_1[4]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[4]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    L0_1 = string
    L0_1 = L0_1.lower
    L1_1 = this_sigattrlog
    L1_1 = L1_1[4]
    L1_1 = L1_1.utf8p1
    L0_1 = L0_1(L1_1)
    L2_1 = L0_1
    L1_1 = L0_1.find
    L3_1 = "\\windows nt\\"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 then
      L1_1 = sysio
      L1_1 = L1_1.IsFileExists
      L2_1 = L0_1
      L1_1 = L1_1(L2_1)
      if not L1_1 then
        L1_1 = mp
        L1_1 = L1_1.CLEAN
        return L1_1
      end
      L1_1 = mp
      L1_1 = L1_1.IsKnownFriendlyFile
      L2_1 = L0_1
      L3_1 = true
      L4_1 = false
      L1_1 = L1_1(L2_1, L3_1, L4_1)
      if L1_1 ~= nil and L1_1 == true then
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
      L2_1 = {}
      L2_1[".dll"] = true
      L2_1[".ocx"] = true
      L3_1 = bm_AddRelatedFileFromCommandLine
      L4_1 = L0_1
      L5_1 = L2_1
      L6_1 = nil
      L7_1 = 6
      L3_1(L4_1, L5_1, L6_1, L7_1)
      L3_1 = mp
      L3_1 = L3_1.INFECTED
      return L3_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
