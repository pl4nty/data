-- Threat: !InfrastructureShared
-- Name: !#JenxcusInsertDeobfuscator
-- Type: 13
-- Includes: ConversionToBinary_fastDec2Bin
-- MpAttributes: SCPT:JenxcusInsertObf & !SCPT:JenxcusBase64Obf

local l_0_0 = mp.getfilesize()
if l_0_0 < 1024 then
  return mp.CLEAN
end
if 2097152 < l_0_0 then
  return mp.CLEAN
end
local l_0_1, l_0_2, l_0_3 = string.find(tostring(footerpage), "\".+[Ss][Pp][Ll][Ii][Tt]%([a-zA-Z0-9_]+,\"(.+)\"%)")
local l_0_4, l_0_5 = string.gsub(l_0_3, "([%.%$%%%^%+%-%*%?%(%)%{%}%[%]])", "%%%1")
local l_0_6, l_0_7, l_0_8 = string.find(tostring(headerpage), "\".*" .. l_0_4)
mp.readprotection(false)
local l_0_9 = mp.getfilesize() - mp.FOOTERPAGE_SZ + l_0_1 - l_0_6 - 1
local l_0_10 = mp.readfile(l_0_6, l_0_9)
mp.vfo_add_buffer(fastDec2Bin(l_0_10, "(%d-)" .. l_0_4), "[JXS]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
