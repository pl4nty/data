local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.SIGATTR_LOG_SZ
L1_1 = ""
L2_1 = 0
L3_1 = 1
L4_1 = L0_1
L5_1 = 1
for L6_1 = L3_1, L4_1, L5_1 do
  L7_1 = sigattr_tail
  L7_1 = L7_1[L6_1]
  L7_1 = L7_1.attribute
  if L7_1 == 16386 then
    L7_1 = sigattr_tail
    L7_1 = L7_1[L6_1]
    L7_1 = L7_1.utf8p2
    L8_1 = L7_1
    L7_1 = L7_1.lower
    L7_1 = L7_1(L8_1)
    L8_1 = sigattr_tail
    L8_1 = L8_1[L6_1]
    L8_1 = L8_1.utf8p1
    L9_1 = L8_1
    L8_1 = L8_1.lower
    L8_1 = L8_1(L9_1)
    L10_1 = L8_1
    L9_1 = L8_1.sub
    L11_1 = 1
    L12_1 = #L7_1
    L9_1 = L9_1(L10_1, L11_1, L12_1)
    if L9_1 == L7_1 then
      L10_1 = L8_1
      L9_1 = L8_1.sub
      L11_1 = #L7_1
      L11_1 = L11_1 + 1
      L9_1 = L9_1(L10_1, L11_1)
      if L9_1 then
        L10_1 = mp
        L10_1 = L10_1.GetExtensionClass
        L11_1 = L9_1
        L10_1 = L10_1(L11_1)
        if L10_1 == 0 then
          if L1_1 == nil then
            L1_1 = L9_1
            L2_1 = L2_1 + 1
          elseif L9_1 == L1_1 then
            L2_1 = L2_1 + 1
          end
        end
      end
    end
  end
  if 5 <= L2_1 and L1_1 then
    L7_1 = isKnownRansomExtension
    L8_1 = L1_1
    L7_1 = L7_1(L8_1)
    if L7_1 then
      L7_1 = mp
      L7_1 = L7_1.INFECTED
      return L7_1
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
