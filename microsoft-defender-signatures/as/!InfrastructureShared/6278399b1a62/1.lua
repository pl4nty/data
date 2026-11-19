-- Threat: !InfrastructureShared
-- Name: 6278399b1a62
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
