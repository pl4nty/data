-- Threat: !InfrastructureShared
-- Name: 757807fb0514
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
