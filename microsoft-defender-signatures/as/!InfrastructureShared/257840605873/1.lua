-- Threat: !InfrastructureShared
-- Name: 257840605873
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
