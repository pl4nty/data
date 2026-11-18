-- Threat: !InfrastructureShared
-- Name: c5407f15b54a
-- Type: 21

if mp.get_mpattribute("pea_headerchecksum0") and mp.getfilesize() < 1536000 then
  return mp.INFECTED
end
return mp.CLEAN
