-- Threat: !InfrastructureShared
-- Name: a078e4f0d485
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
