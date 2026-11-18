-- Threat: !InfrastructureShared
-- Name: 4878872e6612
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
