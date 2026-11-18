-- Threat: !InfrastructureShared
-- Name: 5b78be9dc089
-- Type: 21

if mp.get_mpattribute("PACKED:UPX") then
  return mp.INFECTED
end
return mp.CLEAN
