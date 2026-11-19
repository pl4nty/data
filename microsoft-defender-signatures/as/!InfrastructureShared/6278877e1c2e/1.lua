-- Threat: !InfrastructureShared
-- Name: 6278877e1c2e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
