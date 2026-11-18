-- Threat: !InfrastructureShared
-- Name: 867821890297
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
