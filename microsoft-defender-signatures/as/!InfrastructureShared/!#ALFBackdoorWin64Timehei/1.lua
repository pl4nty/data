local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 == 3010425 or L0_1 == 3070329 or L0_1 == 3227513 or L0_1 == 3160953 then
  L1_1 = mp
  L1_1 = L1_1.readheader
  L2_1 = 0
  L3_1 = 256
  L1_1 = L1_1(L2_1, L3_1)
  L2_1 = 0
  L3_1 = 0
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L1_1
  L6_1 = "\000\000"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = {}
  L5_1 = string
  L5_1 = L5_1.byte
  L6_1 = L1_1
  L7_1 = 1
  L8_1 = -1
  L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L5_1(L6_1, L7_1, L8_1)
  L4_1[1] = L5_1
  L4_1[2] = L6_1
  L4_1[3] = L7_1
  L4_1[4] = L8_1
  L4_1[5] = L9_1
  L4_1[6] = L10_1
  L5_1 = 1
  L6_1 = #L4_1
  L7_1 = 1
  for L8_1 = L5_1, L6_1, L7_1 do
    L9_1 = L4_1[L8_1]
    if L9_1 == 0 then
      L2_1 = L2_1 + 1
      if 4 < L2_1 then
        L10_1 = mp
        L10_1 = L10_1.CLEAN
        return L10_1
      end
    elseif 32 <= L9_1 and L9_1 <= 127 or 9 <= L9_1 and L9_1 <= 13 then
      L3_1 = L3_1 + 1
    end
  end
  if 180 < L3_1 then
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    return L5_1
  end
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
