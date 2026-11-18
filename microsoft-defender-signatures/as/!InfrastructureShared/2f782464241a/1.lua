-- Threat: !InfrastructureShared
-- Name: 2f782464241a
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 160000 then
  return mp.INFECTED
end
return mp.CLEAN
