-- Threat: !InfrastructureShared
-- Name: b1780c216f7d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
