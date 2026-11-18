-- Threat: !InfrastructureShared
-- Name: 5f7875e957d8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
