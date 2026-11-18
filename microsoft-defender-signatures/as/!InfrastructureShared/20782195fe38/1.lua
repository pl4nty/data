-- Threat: !InfrastructureShared
-- Name: 20782195fe38
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
