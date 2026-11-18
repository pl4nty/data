-- Threat: !InfrastructureShared
-- Name: 557815aee8d3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
