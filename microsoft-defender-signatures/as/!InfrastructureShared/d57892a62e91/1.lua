-- Threat: !InfrastructureShared
-- Name: d57892a62e91
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
