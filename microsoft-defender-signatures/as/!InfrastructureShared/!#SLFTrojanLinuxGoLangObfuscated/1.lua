-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Linux/GoLangObfuscated
-- Type: 13
-- MpAttributes: BM_ELF_FILE & RPF:GoLang:pclntab_magic_unknown

local l_0_0 = mp.get_mpattributevalue("RPF:GoLang:pclntab_magic_unknown")
if l_0_0 and mp.bitand(l_0_0, 4294967280) ~= 4294967280 then
  local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
  if not l_0_1 then
    return mp.INFECTED
  end
  local l_0_2 = 86400
  local l_0_3 = "obfuscated_golang"
  local l_0_4, l_0_5 = pcall(MpCommon.RollingQueueCreate, l_0_3, 500, l_0_2, 1)
  if not l_0_4 then
    return mp.INFECTED
  end
  l_0_4, l_0_5 = pcall(MpCommon.RollingQueueAppend, l_0_3, l_0_1, "", l_0_2)
  return mp.INFECTED
end
return mp.CLEAN
