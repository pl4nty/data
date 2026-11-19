-- Threat: !InfrastructureShared
-- Name: 10178085ab396
-- Type: 21

if (peattributes.no_security and peattributes.isexe) == true then
  return mp.INFECTED
end
return mp.CLEAN
