-- Threat: !InfrastructureShared
-- Name: 8e78657d2a2b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
