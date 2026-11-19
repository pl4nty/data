-- Threat: !InfrastructureShared
-- Name: f37850d603da
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
