-- Threat: !InfrastructureShared
-- Name: 776175bb1bc7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
