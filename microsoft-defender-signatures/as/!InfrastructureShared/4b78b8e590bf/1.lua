-- Threat: !InfrastructureShared
-- Name: 4b78b8e590bf
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
