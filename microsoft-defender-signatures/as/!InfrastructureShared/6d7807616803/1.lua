-- Threat: !InfrastructureShared
-- Name: 6d7807616803
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
