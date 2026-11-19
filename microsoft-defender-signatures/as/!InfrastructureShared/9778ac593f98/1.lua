-- Threat: !InfrastructureShared
-- Name: 9778ac593f98
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
