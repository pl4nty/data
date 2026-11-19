-- Threat: !InfrastructureShared
-- Name: 81783652073f
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 1300000 then
  return mp.INFECTED
end
return mp.CLEAN
