-- Threat: !InfrastructureShared
-- Name: 5d786d9d6d93
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
