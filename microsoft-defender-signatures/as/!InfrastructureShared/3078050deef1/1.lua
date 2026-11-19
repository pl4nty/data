-- Threat: !InfrastructureShared
-- Name: 3078050deef1
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
