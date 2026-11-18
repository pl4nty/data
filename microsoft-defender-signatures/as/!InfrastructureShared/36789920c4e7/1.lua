-- Threat: !InfrastructureShared
-- Name: 36789920c4e7
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
