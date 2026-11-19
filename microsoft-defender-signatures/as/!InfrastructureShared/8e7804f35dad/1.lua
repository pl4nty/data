-- Threat: !InfrastructureShared
-- Name: 8e7804f35dad
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
