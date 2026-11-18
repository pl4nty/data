-- Threat: !InfrastructureShared
-- Name: 10a78bb3b31a7
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
