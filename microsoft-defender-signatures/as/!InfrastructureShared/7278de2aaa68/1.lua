-- Threat: !InfrastructureShared
-- Name: 7278de2aaa68
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
