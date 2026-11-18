-- Threat: !InfrastructureShared
-- Name: 24785b8e915c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
