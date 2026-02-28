local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.HEADERPAGE_SZ
if L0_1 < 1024 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u16
L1_1 = headerpage
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 33328 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = headerpage
L2_1 = 5
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == 2250901766 then
  L0_1 = mp
  L0_1 = L0_1.readu_u32
  L1_1 = headerpage
  L2_1 = 9
  L0_1 = L0_1(L1_1, L2_1)
  if L0_1 == 234325576 then
    L0_1 = mp
    L0_1 = L0_1.readu_u16
    L1_1 = headerpage
    L2_1 = 13
    L0_1 = L0_1(L1_1, L2_1)
    if L0_1 == 1793 then
      L0_1 = headerpage
      L0_1 = L0_1[15]
      if L0_1 == 2 then
        goto lbl_46
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_46::
L0_1 = mp
L0_1 = L0_1.UfsGetMetadataBool
L1_1 = "Lua:SignedVBEVBSFile"
L2_1 = true
L0_1, L1_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 0 or not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = tostring
L3_1 = headerpage
L2_1 = L2_1(L3_1)
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = "\006\003U\004\t"
L6_1 = 176
L7_1 = true
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.crc32
L5_1 = -1
L6_1 = L2_1
L7_1 = L3_1
L8_1 = 128
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if L4_1 == 16967505 then
  L5_1 = mp
  L5_1 = L5_1.get_mpattribute
  L6_1 = "RPF:AnyFileHasIOAVURL"
  L5_1 = L5_1(L6_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  else
    L5_1 = mp
    L5_1 = L5_1.set_mpattribute
    L6_1 = "Rogue:VBS/TrapwotCert"
    L5_1(L6_1)
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
