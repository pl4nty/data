-- Threat: !InfrastructureShared
-- Name: 3b7890a697b7
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
