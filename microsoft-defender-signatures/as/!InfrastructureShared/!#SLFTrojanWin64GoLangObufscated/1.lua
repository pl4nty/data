-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win64/GoLangObufscated
-- Type: 11
-- MpAttributes: RPF:GoLang:pclntab_magic_unknown & pea_amd64_image

local l_0_0 = mp.get_mpattributevalue("RPF:GoLang:pclntab_magic_unknown")
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil then
  return mp.CLEAN
end
if l_0_1:find("frpc.exe", 1, true) then
  return mp.CLEAN
end
if l_0_0 and mp.bitand(l_0_0, 4294967280) ~= 4294967280 then
  return mp.INFECTED
end
return mp.CLEAN
