-- Threat: !InfrastructureShared
-- Name: !#Trojan:JS/Flafisi.B.1
-- Type: 13
-- MpAttributes: SCRIPT:PowerShell

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "flash.*player.*%.hta") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
