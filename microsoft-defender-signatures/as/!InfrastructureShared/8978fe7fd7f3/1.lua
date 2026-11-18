-- Threat: !InfrastructureShared
-- Name: 8978fe7fd7f3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
