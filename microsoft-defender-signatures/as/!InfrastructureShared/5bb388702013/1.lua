local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 then
    L1_1 = this_sigattrlog
    L1_1 = L1_1[1]
    L0_1 = L1_1.utf8p2
  end
end
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = safeJsonDeserialize
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = 0
if L0_1 ~= nil then
  L2_1 = L0_1.sig_count
  if not L2_1 then
    L2_1 = nil
  end
  if L2_1 ~= nil and L2_1 < 60 then
    L2_1 = 1
    L3_1 = L0_1.file_size
    L4_1 = {}
    L5_1 = true
    L6_1 = nil
    L7_1 = nil
    L8_1 = nil
    L9_1 = nil
    if L3_1 ~= nil then
      L10_1 = 1
      L11_1 = #L3_1
      L12_1 = 4
      for L13_1 = L10_1, L11_1, L12_1 do
        L6_1 = L3_1[L13_1]
        L14_1 = L13_1 + 1
        L7_1 = L3_1[L14_1]
        L14_1 = L13_1 + 2
        L8_1 = L3_1[L14_1]
        L14_1 = L13_1 + 3
        L9_1 = L3_1[L14_1]
        if L6_1 ~= nil and L7_1 ~= nil and L8_1 ~= nil and L9_1 ~= nil then
          L14_1 = L4_1[L7_1]
          if L14_1 == nil then
            L4_1[L7_1] = 1
            L1_1 = L1_1 + 1
          end
          L14_1 = L4_1[L9_1]
          if L14_1 == nil then
            L4_1[L9_1] = 1
            L1_1 = L1_1 + 1
          end
          if L7_1 < 1024 or L9_1 < 1024 then
            L5_1 = false
          end
        end
      end
    end
    if L5_1 == true and 8 <= L1_1 then
      L10_1 = mp
      L10_1 = L10_1.INFECTED
      return L10_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
