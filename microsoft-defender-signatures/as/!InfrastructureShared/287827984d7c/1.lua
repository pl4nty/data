-- Threat: !InfrastructureShared
-- Name: 287827984d7c
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
