-- Threat: !InfrastructureShared
-- Name: 3e7884f2239b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
