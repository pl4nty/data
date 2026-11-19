-- Threat: !InfrastructureShared
-- Name: 2778a380440a
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
