-- Threat: !InfrastructureShared
-- Name: 6a782b9b22a0
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
