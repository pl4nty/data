-- Threat: !InfrastructureShared
-- Name: 9a78f2ae7c4f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
