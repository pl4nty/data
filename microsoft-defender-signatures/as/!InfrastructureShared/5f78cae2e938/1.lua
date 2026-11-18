-- Threat: !InfrastructureShared
-- Name: 5f78cae2e938
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
