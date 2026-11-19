-- Threat: !InfrastructureShared
-- Name: 51781a909109
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
