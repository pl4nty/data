-- Threat: !InfrastructureShared
-- Name: 3e78aca4f28a
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
