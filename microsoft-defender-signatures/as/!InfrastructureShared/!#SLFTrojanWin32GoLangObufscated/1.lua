-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win32/GoLangObufscated
-- Type: 11
-- MpAttributes: RPF:GoLang:pclntab_magic_unknown & !pea_amd64_image

local l_0_0 = mp.get_mpattributevalue("RPF:GoLang:pclntab_magic_unknown")
if l_0_0 and mp.bitand(l_0_0, 4294967280) ~= 4294967280 then
  return mp.INFECTED
end
return mp.CLEAN
