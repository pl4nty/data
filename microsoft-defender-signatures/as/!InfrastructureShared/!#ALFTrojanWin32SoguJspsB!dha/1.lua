local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if 1048576 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = pehdr
L1_1 = L1_1.NumberOfSections
if 10 < L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = 77
L2_1 = 1
L3_1 = pehdr
L3_1 = L3_1.NumberOfSections
L4_1 = 1
for L5_1 = L2_1, L3_1, L4_1 do
  L6_1 = pesecs
  L6_1 = L6_1[L5_1]
  L6_1 = L6_1.Name
  if L6_1 == ".data" then
    L6_1 = pesecs
    L6_1 = L6_1[L5_1]
    L6_1 = L6_1.PointerToRawData
    L7_1 = pesecs
    L7_1 = L7_1[L5_1]
    L7_1 = L7_1.SizeOfRawData
    if L6_1 ~= 0 and L7_1 ~= 0 then
      L8_1 = L6_1 + L7_1
      if L0_1 >= L8_1 and L1_1 <= L7_1 then
        L8_1 = mp
        L8_1 = L8_1.readprotection
        L9_1 = false
        L8_1(L9_1)
        L8_1 = mp
        L8_1 = L8_1.readfile
        L9_1 = L6_1
        L10_1 = L1_1
        L8_1 = L8_1(L9_1, L10_1)
        L9_1 = mp
        L9_1 = L9_1.readprotection
        L10_1 = true
        L9_1(L10_1)
        L9_1 = mp
        L9_1 = L9_1.readu_u32
        L10_1 = L8_1
        L11_1 = 1
        L9_1 = L9_1(L10_1, L11_1)
        L10_1 = mp
        L10_1 = L10_1.readu_u32
        L11_1 = L8_1
        L12_1 = 64
        L10_1 = L10_1(L11_1, L12_1)
        L11_1 = mp
        L11_1 = L11_1.readu_u32
        L12_1 = L8_1
        L13_1 = 73
        L11_1 = L11_1(L12_1, L13_1)
        if L9_1 ~= 1000 then
          L12_1 = mp
          L12_1 = L12_1.bitxor
          L13_1 = L9_1
          L14_1 = L10_1
          L12_1 = L12_1(L13_1, L14_1)
          if L12_1 == 1000 then
            L12_1 = mp
            L12_1 = L12_1.bitxor
            L13_1 = L9_1
            L14_1 = L11_1
            L12_1 = L12_1(L13_1, L14_1)
            if L12_1 == 1000 then
              L12_1 = mp
              L12_1 = L12_1.INFECTED
              return L12_1
            end
          end
        end
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
