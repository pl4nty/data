-- Threat: !InfrastructureShared
-- Name: 4978cd0ab904
-- Type: 21

if (peattributes.isexe and peattributes.no_security) == true then
  return mp.INFECTED
end
return mp.CLEAN
