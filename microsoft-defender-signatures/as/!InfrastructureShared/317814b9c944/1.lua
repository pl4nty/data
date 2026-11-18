-- Threat: !InfrastructureShared
-- Name: 317814b9c944
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
