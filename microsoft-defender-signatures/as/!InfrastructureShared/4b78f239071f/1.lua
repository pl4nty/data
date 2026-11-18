-- Threat: !InfrastructureShared
-- Name: 4b78f239071f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
