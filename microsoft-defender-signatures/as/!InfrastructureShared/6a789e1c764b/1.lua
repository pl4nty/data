-- Threat: !InfrastructureShared
-- Name: 6a789e1c764b
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
