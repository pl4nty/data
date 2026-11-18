-- Threat: !InfrastructureShared
-- Name: f178bab713a7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
