-- Threat: !InfrastructureShared
-- Name: !#LUA:SingleLetterExeNameInRTF
-- Type: 13
-- MpAttributes: BM_MZ_FILE

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "%-%>%(rtf[0-9]+%)%-%>[a-z].[a-z]$") ~= nil then
  return mp.INFECTED
elseif string.find(l_0_0, "%-%>%(rtf[0-9]+%)%-%>") ~= nil then
  mp.set_mpattribute("//LUA:ExeInRTF")
end
return mp.CLEAN
