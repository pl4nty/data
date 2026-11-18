-- Threat: !InfrastructureShared
-- Name: 777802d10aef
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
