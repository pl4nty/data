-- Threat: !InfrastructureShared
-- Name: 4f78d17c1bc7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
