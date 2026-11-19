-- Threat: !InfrastructureShared
-- Name: bd78f9c81fe0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
