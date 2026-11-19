-- Threat: !InfrastructureShared
-- Name: 7978c7ded3c3
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
