-- Threat: !InfrastructureShared
-- Name: 99781f8888d8
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
