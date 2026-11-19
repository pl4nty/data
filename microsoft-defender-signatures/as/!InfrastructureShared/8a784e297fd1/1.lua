-- Threat: !InfrastructureShared
-- Name: 8a784e297fd1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
