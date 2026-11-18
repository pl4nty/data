-- Threat: !InfrastructureShared
-- Name: 8e782cad73b0
-- Type: 21

if peattributes.no_security and mp.getfilesize() > 5500000 and mp.getfilesize() < 6800000 then
  return mp.INFECTED
end
return mp.CLEAN
