-- Threat: !InfrastructureShared
-- Name: 6a78fa607f39
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
