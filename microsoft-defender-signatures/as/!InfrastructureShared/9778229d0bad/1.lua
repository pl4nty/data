-- Threat: !InfrastructureShared
-- Name: 9778229d0bad
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
