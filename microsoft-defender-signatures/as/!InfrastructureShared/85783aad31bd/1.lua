-- Threat: !InfrastructureShared
-- Name: 85783aad31bd
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
