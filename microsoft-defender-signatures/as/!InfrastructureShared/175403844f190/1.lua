-- Threat: !InfrastructureShared
-- Name: 175403844f190
-- Type: 21

if mp.get_mpattribute("pea_headerchecksum0") and mp.getfilesize() < 1536000 then
  return mp.INFECTED
end
return mp.CLEAN
