-- Threat: !InfrastructureShared
-- Name: a7780c48c85e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
