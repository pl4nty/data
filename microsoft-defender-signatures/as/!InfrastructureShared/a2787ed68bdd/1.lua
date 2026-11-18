-- Threat: !InfrastructureShared
-- Name: a2787ed68bdd
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
