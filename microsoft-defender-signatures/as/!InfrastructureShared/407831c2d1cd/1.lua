-- Threat: !InfrastructureShared
-- Name: 407831c2d1cd
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
