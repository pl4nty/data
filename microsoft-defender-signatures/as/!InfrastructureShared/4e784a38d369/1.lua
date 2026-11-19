-- Threat: !InfrastructureShared
-- Name: 4e784a38d369
-- Type: 21

if peattributes.no_security == true and mp.get_mpattribute("NID:Trojan:Win32/PswStealer.ats01") then
  return mp.INFECTED
end
return mp.CLEAN
