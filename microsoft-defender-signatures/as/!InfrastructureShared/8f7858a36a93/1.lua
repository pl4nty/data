-- Threat: !InfrastructureShared
-- Name: 8f7858a36a93
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
