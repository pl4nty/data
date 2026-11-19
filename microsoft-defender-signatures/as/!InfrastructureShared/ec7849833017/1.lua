-- Threat: !InfrastructureShared
-- Name: ec7849833017
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
