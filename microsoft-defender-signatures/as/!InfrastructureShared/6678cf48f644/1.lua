-- Threat: !InfrastructureShared
-- Name: 6678cf48f644
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
