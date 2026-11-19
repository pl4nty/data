-- Threat: !InfrastructureShared
-- Name: 1f97869d9a22d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
