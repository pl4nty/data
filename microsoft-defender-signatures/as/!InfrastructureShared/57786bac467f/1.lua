-- Threat: !InfrastructureShared
-- Name: 57786bac467f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
