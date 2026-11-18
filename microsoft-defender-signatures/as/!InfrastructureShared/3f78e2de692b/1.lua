-- Threat: !InfrastructureShared
-- Name: 3f78e2de692b
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
