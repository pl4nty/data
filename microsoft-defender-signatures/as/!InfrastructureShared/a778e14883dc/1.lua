-- Threat: !InfrastructureShared
-- Name: a778e14883dc
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
