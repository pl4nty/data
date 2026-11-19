-- Threat: !InfrastructureShared
-- Name: 8b78c947ec2c
-- Type: 21

if peattributes.ismsil == true and mp.get_mpattribute("pea_headerchecksum0") then
  return mp.INFECTED
end
return mp.CLEAN
