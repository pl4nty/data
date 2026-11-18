-- Threat: !InfrastructureShared
-- Name: 8978d4423aa7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
