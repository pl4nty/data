-- Threat: !InfrastructureShared
-- Name: 35611c0dbf94
-- Type: 21

if mp.get_mpattribute("NID:Win64/CryptInject.PG!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
