-- Threat: !InfrastructureShared
-- Name: !#JenxcusBase64Deobfuscator
-- Type: 13
-- MpAttributes: SCPT:JenxcusBase64Obf

if mp.getfilesize() < mp.FOOTERPAGE_SZ * 3 then
  return mp.CLEAN
end
local l_0_0, l_0_1, l_0_2, l_0_3 = string.find(tostring(headerpage), "\"[A-Za-z0-9%+/][A-Za-z0-9%+/]=(=?)(..-)[A-Za-z0-9%+/][A-Za-z0-9%+/]=")
local l_0_4, l_0_5 = string.gsub(l_0_3, "([%.%$%%%^%+%-%*%?%(%)%{%}%[%]])", "%%%1")
mp.readprotection(false)
local l_0_6 = mp.getfilesize() - l_0_0
if 2097152 < l_0_6 then
  l_0_6 = 2097152
end
local l_0_7 = mp.readfile(l_0_0, l_0_6)
local l_0_8
if l_0_2 == "=" then
  l_0_8, l_0_5 = l_0_7:gsub(l_0_4, ""):gsub("\".+", "")
else
  l_0_8, l_0_5 = l_0_7:gsub(l_0_4, "="):gsub("\".+", "")
end
mp.set_mpattribute("//MpBase64DecodeLongLines")
mp.vfo_add_buffer(l_0_8, "[JXS64]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
