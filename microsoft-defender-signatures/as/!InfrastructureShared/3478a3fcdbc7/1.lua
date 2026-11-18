-- Threat: !InfrastructureShared
-- Name: 3478a3fcdbc7
-- Type: 21

if mp.get_mpattribute("NID:ALF:INTL:Trojan:Win32/Multiverze") then
  return mp.INFECTED
end
return mp.CLEAN
