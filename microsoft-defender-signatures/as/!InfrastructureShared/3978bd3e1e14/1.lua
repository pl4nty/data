-- Threat: !InfrastructureShared
-- Name: 3978bd3e1e14
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
