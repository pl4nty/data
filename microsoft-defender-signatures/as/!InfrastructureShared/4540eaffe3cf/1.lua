-- Threat: !InfrastructureShared
-- Name: 4540eaffe3cf
-- Type: 21

if mp.get_mpattribute("PACKED:UPX") then
  return mp.INFECTED
end
return mp.CLEAN
