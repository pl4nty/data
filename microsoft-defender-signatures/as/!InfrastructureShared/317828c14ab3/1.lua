-- Threat: !InfrastructureShared
-- Name: 317828c14ab3
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() >= 10289152 then
  return mp.INFECTED
end
return mp.CLEAN
