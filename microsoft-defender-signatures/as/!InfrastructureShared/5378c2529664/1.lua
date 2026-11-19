-- Threat: !InfrastructureShared
-- Name: 5378c2529664
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
