-- Threat: !InfrastructureShared
-- Name: 4478869e82f0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
