-- Threat: !InfrastructureShared
-- Name: 3078791adfdb
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
