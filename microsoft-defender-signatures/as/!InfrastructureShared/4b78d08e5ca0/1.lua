-- Threat: !InfrastructureShared
-- Name: 4b78d08e5ca0
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
