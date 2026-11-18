-- Threat: !InfrastructureShared
-- Name: 5d78f8bc8fdd
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
