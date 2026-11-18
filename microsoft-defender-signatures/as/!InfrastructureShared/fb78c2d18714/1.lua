-- Threat: !InfrastructureShared
-- Name: fb78c2d18714
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
