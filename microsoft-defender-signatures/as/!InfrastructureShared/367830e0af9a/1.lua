-- Threat: !InfrastructureShared
-- Name: 367830e0af9a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
