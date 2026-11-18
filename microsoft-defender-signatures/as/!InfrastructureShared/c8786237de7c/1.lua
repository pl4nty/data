-- Threat: !InfrastructureShared
-- Name: c8786237de7c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
