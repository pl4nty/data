-- Threat: !InfrastructureShared
-- Name: 34782170d280
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
