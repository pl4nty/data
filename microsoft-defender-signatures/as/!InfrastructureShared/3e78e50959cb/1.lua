-- Threat: !InfrastructureShared
-- Name: 3e78e50959cb
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
