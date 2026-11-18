-- Threat: !InfrastructureShared
-- Name: b3781dbe5dfe
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 44546 then
  return mp.INFECTED
end
return mp.CLEAN
