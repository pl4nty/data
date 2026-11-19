-- Threat: !InfrastructureShared
-- Name: 4d78f09c6e9a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
