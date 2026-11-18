-- Threat: !InfrastructureShared
-- Name: 2540e6a6ec79
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
