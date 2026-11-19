-- Threat: !InfrastructureShared
-- Name: 18c7860ba437d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
