-- Threat: !InfrastructureShared
-- Name: 1f5400a4f18e6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
