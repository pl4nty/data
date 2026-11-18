-- Threat: !InfrastructureShared
-- Name: 309784866bdc9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
