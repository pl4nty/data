-- Threat: !InfrastructureShared
-- Name: b778336e18ab
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
