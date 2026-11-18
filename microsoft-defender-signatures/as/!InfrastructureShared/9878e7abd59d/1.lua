-- Threat: !InfrastructureShared
-- Name: 9878e7abd59d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
