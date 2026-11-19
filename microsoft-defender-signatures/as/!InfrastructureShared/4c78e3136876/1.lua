-- Threat: !InfrastructureShared
-- Name: 4c78e3136876
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
