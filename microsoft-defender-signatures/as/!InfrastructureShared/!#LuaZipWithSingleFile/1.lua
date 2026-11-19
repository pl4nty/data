-- Threat: !InfrastructureShared
-- Name: !#LuaZipWithSingleFile
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.HEADERPAGE_SZ < 128 or mp.FOOTERPAGE_SZ < 22 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 1) ~= 67324752 then
  return mp.CLEAN
end
local l_0_0 = mp.readu_u32(headerpage, 19)
if 4194304 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.readu_u16(headerpage, 27)
if 128 < l_0_1 or l_0_1 < 4 or l_0_1 + 31 > mp.HEADERPAGE_SZ then
  return mp.CLEAN
end
local l_0_2 = mp.getfilesize()
if mp.readu_u32(footerpage, mp.FOOTERPAGE_SZ - 21) == 101010256 then
  local l_0_3 = mp.readu_u16(footerpage, mp.FOOTERPAGE_SZ - 11)
  if l_0_3 ~= 1 then
    return mp.CLEAN
  end
else
  local l_0_4 = 30 + l_0_1 + l_0_0 + mp.readu_u16(headerpage, 29) + 1
  local l_0_5 = l_0_4 + 46 + l_0_1
  local l_0_6 = l_0_2 - l_0_5
  if mp.readu_u32(footerpage, mp.FOOTERPAGE_SZ - l_0_6) ~= 101010256 then
    return mp.CLEAN
  end
  local l_0_7 = mp.readu_u16(footerpage, mp.FOOTERPAGE_SZ - l_0_6 + 10)
  if l_0_7 ~= 1 then
    return mp.CLEAN
  end
end
local l_0_8 = string.lower(string.char(headerpage[31 + l_0_1 - 3], headerpage[31 + l_0_1 - 2], headerpage[31 + l_0_1 - 1]))
if l_0_8 ~= "exe" and l_0_8 ~= "pif" and l_0_8 ~= "scr" and l_0_8 ~= ".js" and l_0_8 ~= "jse" and l_0_8 ~= "vbs" and l_0_8 ~= "vbe" and l_0_8 ~= "diagcab" then
  return mp.CLEAN
end
if l_0_8 == ".js" or l_0_8 == "jse" then
  mp.set_mpattribute("//LuaZipWithSingleJS")
end
if l_0_8 == ".diagcab" then
  mp.set_mpattribute("//LuaZipWithSingleDiagCab")
end
if l_0_2 < 4000 then
  mp.set_mpattribute("//LuaZipLT4kbWithSingleFile")
end
return mp.INFECTED
