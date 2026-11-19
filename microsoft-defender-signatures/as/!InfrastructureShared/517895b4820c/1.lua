-- Threat: !InfrastructureShared
-- Name: 517895b4820c
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 250000 then
  return mp.INFECTED
end
return mp.CLEAN
