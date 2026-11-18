-- Threat: !InfrastructureShared
-- Name: 1f7860dc8513
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
