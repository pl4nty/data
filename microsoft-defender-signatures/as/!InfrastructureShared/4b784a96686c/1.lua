-- Threat: !InfrastructureShared
-- Name: 4b784a96686c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
