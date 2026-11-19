-- Threat: !InfrastructureShared
-- Name: 9d78f432228a
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
