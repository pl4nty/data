-- Threat: !InfrastructureShared
-- Name: 8c78fbc2e7f9
-- Type: 21

if mp.get_mpattribute("NID:Win32/CryptInject.PN!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
