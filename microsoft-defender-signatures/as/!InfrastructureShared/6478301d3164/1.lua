-- Threat: !InfrastructureShared
-- Name: 6478301d3164
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
