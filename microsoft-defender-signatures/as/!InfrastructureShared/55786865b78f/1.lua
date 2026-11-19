-- Threat: !InfrastructureShared
-- Name: 55786865b78f
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
