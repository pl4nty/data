-- Threat: !InfrastructureShared
-- Name: 100786c1c4e7d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
