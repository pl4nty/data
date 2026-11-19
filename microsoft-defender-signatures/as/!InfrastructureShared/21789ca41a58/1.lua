-- Threat: !InfrastructureShared
-- Name: 21789ca41a58
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
