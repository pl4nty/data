-- Threat: !InfrastructureShared
-- Name: 3a7829138378
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
