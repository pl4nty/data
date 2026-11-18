-- Threat: !InfrastructureShared
-- Name: a47883def9d5
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
