local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 then
    L1_1 = IsKeyInRollingQueue
    L2_1 = "IsProcessChainViaRUNMRU"
    L3_1 = L0_1.ppid
    L4_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1)
    if L1_1 then
      L1_1 = mp
      L1_1 = L1_1.GetScannedPPID
      L1_1 = L1_1()
      if L1_1 == "" or L1_1 == nil then
        L2_1 = mp
        L2_1 = L2_1.CLEAN
        return L2_1
      end
      L2_1 = mp
      L2_1 = L2_1.GetProcessCommandLine
      L3_1 = L1_1
      L2_1 = L2_1(L3_1)
      if not L2_1 then
        L3_1 = mp
        L3_1 = L3_1.CLEAN
        return L3_1
      end
      L3_1 = string
      L3_1 = L3_1.lower
      L4_1 = L2_1
      L3_1 = L3_1(L4_1)
      L2_1 = L3_1
      L3_1 = extract_urls
      L4_1 = L2_1
      L3_1, L4_1 = L3_1(L4_1)
      L5_1 = isnull
      L6_1 = L4_1
      L5_1 = L5_1(L6_1)
      if L5_1 then
        L5_1 = mp
        L5_1 = L5_1.CLEAN
        return L5_1
      end
      L5_1 = ipairs
      L6_1 = L4_1
      L5_1, L6_1, L7_1 = L5_1(L6_1)
      for L8_1, L9_1 in L5_1, L6_1, L7_1 do
        L10_1 = split
        L11_1 = L9_1
        L12_1 = "%."
        L10_1 = L10_1(L11_1, L12_1)
        if not L10_1 then
          L11_1 = mp
          L11_1 = L11_1.CLEAN
          return L11_1
        end
        L11_1 = "."
        L12_1 = tostring
        L13_1 = #L10_1
        L13_1 = L10_1[L13_1]
        L12_1 = L12_1(L13_1)
        L11_1 = L11_1 .. L12_1
        if not L11_1 then
          L12_1 = mp
          L12_1 = L12_1.CLEAN
          return L12_1
        end
        L12_1 = isSuspTLD
        L13_1 = L11_1
        L12_1 = L12_1(L13_1)
        if L12_1 then
          L12_1 = mp
          L12_1 = L12_1.INFECTED
          return L12_1
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
