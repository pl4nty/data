-- Threat: !InfrastructureShared
-- Name: 4a78de4ecbe7
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
