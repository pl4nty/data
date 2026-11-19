-- Threat: !InfrastructureShared
-- Name: 4a7860f6f9c3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
