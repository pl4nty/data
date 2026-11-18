-- Threat: !InfrastructureShared
-- Name: 82788d5d1b5a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
