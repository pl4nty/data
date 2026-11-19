-- Threat: !InfrastructureShared
-- Name: 7d7877e7f420
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
