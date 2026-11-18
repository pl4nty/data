-- Threat: !InfrastructureShared
-- Name: 9478c3e5e99f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
