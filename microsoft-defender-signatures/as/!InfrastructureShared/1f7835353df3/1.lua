-- Threat: !InfrastructureShared
-- Name: 1f7835353df3
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
