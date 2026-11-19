-- Threat: !InfrastructureShared
-- Name: 7478cb1092ca
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
