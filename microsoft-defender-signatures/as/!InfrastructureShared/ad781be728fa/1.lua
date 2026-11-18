-- Threat: !InfrastructureShared
-- Name: ad781be728fa
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
