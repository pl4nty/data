-- Threat: !InfrastructureShared
-- Name: 4b78e57b95c9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
