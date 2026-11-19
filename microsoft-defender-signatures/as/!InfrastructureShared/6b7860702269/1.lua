-- Threat: !InfrastructureShared
-- Name: 6b7860702269
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
