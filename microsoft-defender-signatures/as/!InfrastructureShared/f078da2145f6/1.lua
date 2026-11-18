-- Threat: !InfrastructureShared
-- Name: f078da2145f6
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
