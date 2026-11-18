-- Threat: !InfrastructureShared
-- Name: b278713feb52
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
