-- Threat: !InfrastructureShared
-- Name: f540646f0b45
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
