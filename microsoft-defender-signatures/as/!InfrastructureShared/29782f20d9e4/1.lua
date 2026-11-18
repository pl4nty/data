-- Threat: !InfrastructureShared
-- Name: 29782f20d9e4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
