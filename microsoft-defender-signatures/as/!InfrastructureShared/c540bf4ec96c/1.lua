-- Threat: !InfrastructureShared
-- Name: c540bf4ec96c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
