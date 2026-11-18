-- Threat: !InfrastructureShared
-- Name: a678b9f0ef9f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
