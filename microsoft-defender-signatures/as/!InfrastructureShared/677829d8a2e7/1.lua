-- Threat: !InfrastructureShared
-- Name: 677829d8a2e7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
