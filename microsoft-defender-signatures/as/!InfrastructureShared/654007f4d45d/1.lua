-- Threat: !InfrastructureShared
-- Name: 654007f4d45d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
