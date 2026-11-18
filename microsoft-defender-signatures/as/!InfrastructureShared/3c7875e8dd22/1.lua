-- Threat: !InfrastructureShared
-- Name: 3c7875e8dd22
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
