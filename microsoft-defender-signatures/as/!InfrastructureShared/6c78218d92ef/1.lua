-- Threat: !InfrastructureShared
-- Name: 6c78218d92ef
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
