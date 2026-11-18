-- Threat: !InfrastructureShared
-- Name: 6c7802cc4c08
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
