-- Threat: !InfrastructureShared
-- Name: 4d78d8abe2fd
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
