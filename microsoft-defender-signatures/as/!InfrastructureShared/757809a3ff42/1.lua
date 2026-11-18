-- Threat: !InfrastructureShared
-- Name: 757809a3ff42
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
