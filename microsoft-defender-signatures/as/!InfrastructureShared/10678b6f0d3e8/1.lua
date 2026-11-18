-- Threat: !InfrastructureShared
-- Name: 10678b6f0d3e8
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 90000 then
  return mp.INFECTED
end
return mp.CLEAN
