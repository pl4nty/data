-- Threat: !InfrastructureShared
-- Name: 272943cc9d78
-- Type: 21

if mp.get_mpattribute("GenericAllowlist") then
  return mp.CLEAN
end
return mp.INFECTED
