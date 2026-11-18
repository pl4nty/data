-- Threat: !InfrastructureShared
-- Name: 4978e6538b53
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
