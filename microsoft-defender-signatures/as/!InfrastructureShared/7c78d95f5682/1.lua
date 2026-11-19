-- Threat: !InfrastructureShared
-- Name: 7c78d95f5682
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
