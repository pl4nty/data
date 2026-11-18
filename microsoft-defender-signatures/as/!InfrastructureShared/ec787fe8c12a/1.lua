-- Threat: !InfrastructureShared
-- Name: ec787fe8c12a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
