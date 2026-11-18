-- Threat: !InfrastructureShared
-- Name: 8978753f6f9f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
