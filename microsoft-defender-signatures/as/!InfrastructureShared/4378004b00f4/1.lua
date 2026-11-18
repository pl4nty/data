-- Threat: !InfrastructureShared
-- Name: 4378004b00f4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
