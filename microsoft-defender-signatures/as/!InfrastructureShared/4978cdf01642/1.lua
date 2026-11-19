-- Threat: !InfrastructureShared
-- Name: 4978cdf01642
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") and mp.getfilesize() >= 100000 then
  return mp.INFECTED
end
return mp.CLEAN
