-- Threat: !InfrastructureShared
-- Name: d278a9cb4798
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
