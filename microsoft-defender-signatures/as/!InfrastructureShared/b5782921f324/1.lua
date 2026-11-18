-- Threat: !InfrastructureShared
-- Name: b5782921f324
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
