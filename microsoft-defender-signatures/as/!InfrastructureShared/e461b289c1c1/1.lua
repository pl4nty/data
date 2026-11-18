-- Threat: !InfrastructureShared
-- Name: e461b289c1c1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
