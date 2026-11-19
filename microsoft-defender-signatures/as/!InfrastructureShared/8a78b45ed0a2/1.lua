-- Threat: !InfrastructureShared
-- Name: 8a78b45ed0a2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
