-- Threat: !InfrastructureShared
-- Name: c540777e5595
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
