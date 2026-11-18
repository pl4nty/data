-- Threat: !InfrastructureShared
-- Name: 6278197c1ee2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
