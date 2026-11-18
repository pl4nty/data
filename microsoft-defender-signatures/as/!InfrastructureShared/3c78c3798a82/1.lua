-- Threat: !InfrastructureShared
-- Name: 3c78c3798a82
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
