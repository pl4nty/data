-- Threat: !InfrastructureShared
-- Name: 4378cf0c8d49
-- Type: 21

if mp.get_mpattribute("SIGATTR:FindDNFWindow") then
  return mp.INFECTED
end
return mp.CLEAN
