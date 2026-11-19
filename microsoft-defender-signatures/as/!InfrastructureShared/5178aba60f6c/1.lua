-- Threat: !InfrastructureShared
-- Name: 5178aba60f6c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
