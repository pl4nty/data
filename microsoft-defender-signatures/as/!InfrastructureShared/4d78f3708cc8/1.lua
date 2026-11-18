-- Threat: !InfrastructureShared
-- Name: 4d78f3708cc8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
