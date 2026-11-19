-- Threat: !InfrastructureShared
-- Name: 507881b83a1f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
