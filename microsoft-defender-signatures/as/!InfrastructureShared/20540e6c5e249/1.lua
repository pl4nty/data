-- Threat: !InfrastructureShared
-- Name: 20540e6c5e249
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
