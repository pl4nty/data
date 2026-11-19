-- Threat: !InfrastructureShared
-- Name: 2a7824686d71
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
