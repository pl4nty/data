-- Threat: !InfrastructureShared
-- Name: b1780b07b937
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
