-- Threat: !InfrastructureShared
-- Name: 5578c65d79d0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
