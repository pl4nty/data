-- Threat: !InfrastructureShared
-- Name: 3178f38b5f0f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
