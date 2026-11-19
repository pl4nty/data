-- Threat: !InfrastructureShared
-- Name: 717822d7c36f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
