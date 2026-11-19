-- Threat: !InfrastructureShared
-- Name: 3178df2cb5cd
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
