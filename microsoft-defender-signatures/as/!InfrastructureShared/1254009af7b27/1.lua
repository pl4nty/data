-- Threat: !InfrastructureShared
-- Name: 1254009af7b27
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
