-- Threat: !InfrastructureShared
-- Name: 667816eb1e8f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
