-- Threat: \xac\xa1Sliver.A
-- Type: 13
-- MpAttributes: BM_ELF_FILE & RPF:GoLang:pclntab_magic_unknown & HSTR:Sliver

local l_0_0 = mp.get_mpattributevalue("RPF:GoLang:pclntab_magic_unknown")
if l_0_0 and mp.bitand(l_0_0, 4294967280) ~= 4294967280 then
  return mp.INFECTED
end
return mp.CLEAN
