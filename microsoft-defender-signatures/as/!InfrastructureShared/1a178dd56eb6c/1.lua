-- Threat: !InfrastructureShared
-- Name: 1a178dd56eb6c
-- Type: 21

if peattributes.ismsil == false and peattributes.no_security == true and mp.getfilesize() < 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
