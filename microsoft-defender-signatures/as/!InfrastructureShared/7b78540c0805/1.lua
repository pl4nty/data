-- Threat: !InfrastructureShared
-- Name: 7b78540c0805
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
