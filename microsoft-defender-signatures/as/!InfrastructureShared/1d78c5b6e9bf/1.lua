-- Threat: !InfrastructureShared
-- Name: 1d78c5b6e9bf
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
