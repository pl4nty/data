-- Threat: !InfrastructureShared
-- Name: 377871b9b140
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() > 3700000 and mp.getfilesize() < 3900000 then
  return mp.INFECTED
end
return mp.CLEAN
