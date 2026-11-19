-- Threat: !InfrastructureShared
-- Name: c5403bcf1179
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
