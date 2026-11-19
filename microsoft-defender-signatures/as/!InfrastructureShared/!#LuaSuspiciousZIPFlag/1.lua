-- Threat: !InfrastructureShared
-- Name: !#Lua:SuspiciousZIPFlag
-- Type: 12
-- MpAttributes: BM_ZIP_FILE

if mp.readu_u32(headerpage, 1) ~= 67324752 then
  return mp.CLEAN
end
if mp.readu_u16(headerpage, 7) == 2048 then
  mp.set_mpattribute("Lua:ZipHasLanguageEncodingFlag")
end
local l_0_0 = mp.readu_u16(headerpage, 9)
local l_0_1 = mp.readu_u32(headerpage, 19)
local l_0_2 = mp.readu_u32(headerpage, 23)
if l_0_1 == 0 then
  local l_0_3 = string.char(80, 75, 1, 2)
  local l_0_4 = string.find(tostring(footerpage), l_0_3)
  l_0_1 = mp.readu_u32(footerpage, l_0_4 + 20)
  l_0_2 = mp.readu_u32(footerpage, l_0_4 + 24)
end
if (l_0_1 and l_0_2) ~= 0 then
  local l_0_5 = l_0_2 / l_0_1
  if 5 < l_0_5 and l_0_0 == (8 or 9) or 5 < l_0_5 and l_0_0 == 12 then
    mp.set_mpattribute("Lua:SuspiciousZipRatioCompression")
  end
end
return mp.CLEAN
