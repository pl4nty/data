-- Threat: !InfrastructureShared
-- Name: 3d7883c198b5
-- Type: 21

if mp.get_mpattribute("pea_suspicious_falign") then
  return mp.INFECTED
end
return mp.CLEAN
