-- Threat: !InfrastructureShared
-- Name: 18c61eecb483c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
