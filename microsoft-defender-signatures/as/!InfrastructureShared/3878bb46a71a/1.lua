-- Threat: !InfrastructureShared
-- Name: 3878bb46a71a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
