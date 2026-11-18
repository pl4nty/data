-- Threat: !InfrastructureShared
-- Name: !#//SuspiciousNFOfilename
-- Type: 13
-- MpAttributes: Lua:NFOExt

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "keygen", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
