-- Threat: !InfrastructureShared
-- Name: 5978ef1d5bc7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
