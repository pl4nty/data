-- Threat: !InfrastructureShared
-- Name: 517825387199
-- Type: 21

if (peattributes.isexe and peattributes.no_security) == true then
  return mp.INFECTED
end
return mp.CLEAN
