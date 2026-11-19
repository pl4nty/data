-- Threat: !InfrastructureShared
-- Name: !#LUA:RTF/PossibleMalformedRTF
-- Type: 13
-- MpAttributes: BM_RTF_FILE

local l_0_0 = mp.getfilesize()
if l_0_0 < 9000 or 1000000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = tostring(headerpage)
if nil == string.match(l_0_1, "^{\\rtf1\\") then
  return mp.INFECTED
end
return mp.CLEAN
