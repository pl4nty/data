-- Threat: !InfrastructureShared
-- Name: 8778fc74be41
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
