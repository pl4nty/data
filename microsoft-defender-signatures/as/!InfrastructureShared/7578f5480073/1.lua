-- Threat: !InfrastructureShared
-- Name: 7578f5480073
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
