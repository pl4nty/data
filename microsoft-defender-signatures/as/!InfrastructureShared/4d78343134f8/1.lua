-- Threat: !InfrastructureShared
-- Name: 4d78343134f8
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
