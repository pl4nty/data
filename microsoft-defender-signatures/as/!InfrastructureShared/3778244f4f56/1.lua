-- Threat: !InfrastructureShared
-- Name: 3778244f4f56
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
