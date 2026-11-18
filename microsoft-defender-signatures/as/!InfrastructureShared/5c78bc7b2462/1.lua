-- Threat: !InfrastructureShared
-- Name: 5c78bc7b2462
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
