-- Threat: !InfrastructureShared
-- Name: 367892b8efcf
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
