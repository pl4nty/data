-- Threat: !InfrastructureShared
-- Name: 437838f50655
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
