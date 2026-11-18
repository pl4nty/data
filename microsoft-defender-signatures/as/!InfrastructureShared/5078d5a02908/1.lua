-- Threat: !InfrastructureShared
-- Name: 5078d5a02908
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
