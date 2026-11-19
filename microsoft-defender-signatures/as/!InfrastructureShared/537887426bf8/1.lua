-- Threat: !InfrastructureShared
-- Name: 537887426bf8
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
