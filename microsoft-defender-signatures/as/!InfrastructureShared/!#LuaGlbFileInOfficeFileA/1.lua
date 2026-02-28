local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FNAME
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "->word/media/"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = 16
L2_1 = mp
L2_1 = L2_1.HEADERPAGE_SZ
if L1_1 >= L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.readu_u32
L3_1 = headerpage
L4_1 = 9
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= nil and not (L1_1 >= L2_1) then
  L3_1 = mp
  L3_1 = L3_1.HEADERPAGE_SZ
  if not (L2_1 > L3_1) then
    goto lbl_47
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_47::
L3_1 = tostring
L4_1 = headerpage
L3_1 = L3_1(L4_1)
if L3_1 ~= nil then
  L4_1 = #L3_1
  if not (L4_1 < 288) then
    goto lbl_58
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_58::
L4_1 = string
L4_1 = L4_1.match
L5_1 = L3_1
L6_1 = "data%:application%/gltf%-buffer%;base64%,(.-)\""
L4_1 = L4_1(L5_1, L6_1)
if L4_1 ~= nil then
  L5_1 = #L4_1
  if not (L5_1 < 144) then
    goto lbl_71
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_71::
L5_1 = MpCommon
L5_1 = L5_1.Base64Decode
L6_1 = L4_1
L5_1 = L5_1(L6_1)
if L5_1 == nil then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.set_mpattribute
L7_1 = "Lua:GlbInOfficeFileHasBase64.A"
L6_1(L7_1)
L6_1 = #L5_1
if L6_1 <= 253 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = mp
L6_1 = L6_1.readu_u32
L7_1 = L5_1
L8_1 = 241
L6_1 = L6_1(L7_1, L8_1)
if L6_1 ~= nil and L6_1 == 286331153 then
  L7_1 = mp
  L7_1 = L7_1.set_mpattribute
  L8_1 = "Lua:GlbInOfficeFileHasSuspOffsetF0.A"
  L7_1(L8_1)
end
L7_1 = mp
L7_1 = L7_1.readu_u32
L8_1 = L5_1
L9_1 = 249
L7_1 = L7_1(L8_1, L9_1)
if L7_1 ~= nil and L7_1 == 1094795585 then
  L8_1 = mp
  L8_1 = L8_1.set_mpattribute
  L9_1 = "Lua:GlbInOfficeFileHasSuspOffsetF8.A"
  L8_1(L9_1)
end
L8_1 = mp
L8_1 = L8_1.CLEAN
return L8_1
