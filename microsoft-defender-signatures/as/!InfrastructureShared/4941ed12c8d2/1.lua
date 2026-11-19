-- Threat: !InfrastructureShared
-- Name: 4941ed12c8d2
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
