-- Threat: !InfrastructureShared
-- Name: 9478e7cc32a0
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
