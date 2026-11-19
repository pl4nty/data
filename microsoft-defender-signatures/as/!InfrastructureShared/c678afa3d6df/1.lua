-- Threat: !InfrastructureShared
-- Name: c678afa3d6df
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
