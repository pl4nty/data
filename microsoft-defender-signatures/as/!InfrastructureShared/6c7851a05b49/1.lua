-- Threat: !InfrastructureShared
-- Name: 6c7851a05b49
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
