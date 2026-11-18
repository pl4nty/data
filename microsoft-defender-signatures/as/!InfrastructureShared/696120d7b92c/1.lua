-- Threat: !InfrastructureShared
-- Name: 696120d7b92c
-- Type: 21

if peattributes.no_security == true and mp.get_mpattribute("NID:Trojan:Win32/CryptInject.K!MSR") then
  return mp.INFECTED
end
return mp.CLEAN
