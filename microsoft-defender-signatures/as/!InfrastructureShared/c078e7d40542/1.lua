-- Threat: !InfrastructureShared
-- Name: c078e7d40542
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
