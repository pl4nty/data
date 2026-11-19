-- Threat: !InfrastructureShared
-- Name: b87810608f7e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
