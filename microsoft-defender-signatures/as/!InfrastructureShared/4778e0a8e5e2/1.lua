-- Threat: !InfrastructureShared
-- Name: 4778e0a8e5e2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
