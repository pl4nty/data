local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 ~= 2048 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = headerpage
L0_1 = L0_1[8]
if L0_1 ~= 63 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = {}
L1_1 = 1
L2_1 = 2040
L3_1 = 8
for L4_1 = L1_1, L2_1, L3_1 do
  L5_1 = mp
  L5_1 = L5_1.readu_u32
  L6_1 = headerpage
  L7_1 = L4_1
  L5_1 = L5_1(L6_1, L7_1)
  L6_1 = mp
  L6_1 = L6_1.readu_u32
  L7_1 = headerpage
  L8_1 = L4_1 + 4
  L6_1 = L6_1(L7_1, L8_1)
  if L5_1 ~= 0 then
    L7_1 = mp
    L7_1 = L7_1.bitand
    L8_1 = L5_1
    L9_1 = 4278190080
    L7_1 = L7_1(L8_1, L9_1)
    if L7_1 ~= 4278190080 then
      L7_1 = mp
      L7_1 = L7_1.bitand
      L8_1 = L5_1
      L9_1 = 16711680
      L7_1 = L7_1(L8_1, L9_1)
      if L7_1 ~= 16711680 then
        L7_1 = mp
        L7_1 = L7_1.bitand
        L8_1 = L5_1
        L9_1 = 65280
        L7_1 = L7_1(L8_1, L9_1)
        if L7_1 ~= 65280 then
          L7_1 = mp
          L7_1 = L7_1.bitand
          L8_1 = L5_1
          L9_1 = 255
          L7_1 = L7_1(L8_1, L9_1)
          if not (L7_1 == 255 or 4278059008 <= L5_1) then
            goto lbl_66
          end
        end
      end
    end
  end
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  do return L7_1 end
  ::lbl_66::
  if L6_1 <= 1056964608 or 1072562176 <= L6_1 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
  L7_1 = table
  L7_1 = L7_1.insert
  L8_1 = L0_1
  L9_1 = L5_1
  L7_1(L8_1, L9_1)
end
L1_1 = table
L1_1 = L1_1.sort
L2_1 = L0_1
L1_1(L2_1)
L1_1 = 0
L2_1 = ipairs
L3_1 = L0_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  if L6_1 == L1_1 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
  L1_1 = L6_1
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
