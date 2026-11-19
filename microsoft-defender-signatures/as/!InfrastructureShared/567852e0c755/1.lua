-- Threat: !InfrastructureShared
-- Name: 567852e0c755
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
