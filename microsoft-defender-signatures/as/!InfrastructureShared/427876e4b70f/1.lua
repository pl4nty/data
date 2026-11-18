-- Threat: !InfrastructureShared
-- Name: 427876e4b70f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
