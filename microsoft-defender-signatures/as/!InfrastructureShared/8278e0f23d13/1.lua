-- Threat: !InfrastructureShared
-- Name: 8278e0f23d13
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
