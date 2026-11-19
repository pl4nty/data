-- Threat: !InfrastructureShared
-- Name: 4a78f43c0045
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
