-- Threat: !InfrastructureShared
-- Name: 39782e6cff7a
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() > 3600000 and mp.getfilesize() < 4300000 then
  return mp.INFECTED
end
return mp.CLEAN
