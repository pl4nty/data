-- Threat: !InfrastructureShared
-- Name: 78784d8627e2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
