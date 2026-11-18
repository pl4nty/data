-- Threat: !InfrastructureShared
-- Name: 1ef781a1333f4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
