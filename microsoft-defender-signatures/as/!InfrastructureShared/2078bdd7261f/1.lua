-- Threat: !InfrastructureShared
-- Name: 2078bdd7261f
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
