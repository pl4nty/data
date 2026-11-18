-- Threat: !InfrastructureShared
-- Name: 3d78e37d3155
-- Type: 21

if peattributes.no_security and mp.getfilesize() < 290000 then
  return mp.INFECTED
end
return mp.CLEAN
