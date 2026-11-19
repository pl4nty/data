-- Threat: !InfrastructureShared
-- Name: 43785135bb1b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
