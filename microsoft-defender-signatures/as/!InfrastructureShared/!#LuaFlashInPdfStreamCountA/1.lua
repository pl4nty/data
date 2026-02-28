local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = headerpage
L3_1 = 1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = 16777215
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 5461830 then
  L0_1 = mp
  L0_1 = L0_1.bitand
  L1_1 = mp
  L1_1 = L1_1.readu_u32
  L2_1 = headerpage
  L3_1 = 1
  L1_1 = L1_1(L2_1, L3_1)
  L2_1 = 16777215
  L0_1 = L0_1(L1_1, L2_1)
  if L0_1 ~= 5461827 then
    L0_1 = mp
    L0_1 = L0_1.bitand
    L1_1 = mp
    L1_1 = L1_1.readu_u32
    L2_1 = headerpage
    L3_1 = 1
    L1_1 = L1_1(L2_1, L3_1)
    L2_1 = 16777215
    L0_1 = L0_1(L1_1, L2_1)
    if L0_1 ~= 5461850 then
      L0_1 = mp
      L0_1 = L0_1.CLEAN
      return L0_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.match
  L2_1 = L0_1
  L3_1 = "->%(pdf(%d+):"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == nil then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = tonumber
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
  if 5 < L1_1 then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = "//Lua:FlashInPdfMoreThan_5"
    L2_1(L3_1)
  elseif 3 < L1_1 then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = "//Lua:FlashInPdfMoreThan_3"
    L2_1(L3_1)
  elseif 2 < L1_1 then
    L2_1 = mp
    L2_1 = L2_1.set_mpattribute
    L3_1 = "//Lua:FlashInPdfMoreThan_2"
    L2_1(L3_1)
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
