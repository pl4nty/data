-- Threat: !InfrastructureShared
-- Name: b6785b1e2f0a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
