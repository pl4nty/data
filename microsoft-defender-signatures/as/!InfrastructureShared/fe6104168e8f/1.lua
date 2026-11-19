-- Threat: !InfrastructureShared
-- Name: fe6104168e8f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
