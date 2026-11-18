-- Threat: !InfrastructureShared
-- Name: 2578f04bab98
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
