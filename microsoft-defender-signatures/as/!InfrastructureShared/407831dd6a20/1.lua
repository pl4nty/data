-- Threat: !InfrastructureShared
-- Name: 407831dd6a20
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
