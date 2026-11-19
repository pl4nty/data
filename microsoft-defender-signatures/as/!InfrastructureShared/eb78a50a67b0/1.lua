-- Threat: !InfrastructureShared
-- Name: eb78a50a67b0
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() >= 10289152 then
  return mp.INFECTED
end
return mp.CLEAN
