-- Threat: !InfrastructureShared
-- Name: c540c226af9e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
