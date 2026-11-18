-- Threat: !InfrastructureShared
-- Name: 47782957d5d0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
