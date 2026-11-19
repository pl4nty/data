-- Threat: !InfrastructureShared
-- Name: 95404b0f4bd3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
