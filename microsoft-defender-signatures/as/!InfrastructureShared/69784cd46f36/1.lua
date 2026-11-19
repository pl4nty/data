-- Threat: !InfrastructureShared
-- Name: 69784cd46f36
-- Type: 21

if mp.get_mpattribute("NID:Win32/HiveCrypt.PB!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
