-- Threat: !InfrastructureShared
-- Name: 52788e823a96
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
