-- Threat: !InfrastructureShared
-- Name: 66789f0f4a76
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
