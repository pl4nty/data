-- Threat: !InfrastructureShared
-- Name: 169789e869367
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 82000 then
  return mp.INFECTED
end
return mp.CLEAN
