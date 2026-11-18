-- Threat: !InfrastructureShared
-- Name: b1785bdd7b6f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
