-- Threat: !InfrastructureShared
-- Name: 28788376aa43
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
