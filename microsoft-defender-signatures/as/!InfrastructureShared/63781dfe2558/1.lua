-- Threat: !InfrastructureShared
-- Name: 63781dfe2558
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
