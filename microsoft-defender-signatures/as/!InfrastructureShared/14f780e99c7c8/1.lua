-- Threat: !InfrastructureShared
-- Name: 14f780e99c7c8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
