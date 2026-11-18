-- Threat: !InfrastructureShared
-- Name: 2778b71c722f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
