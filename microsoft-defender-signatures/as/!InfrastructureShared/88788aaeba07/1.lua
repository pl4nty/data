-- Threat: !InfrastructureShared
-- Name: 88788aaeba07
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 245762 then
  return mp.INFECTED
end
return mp.CLEAN
