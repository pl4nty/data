-- Threat: !InfrastructureShared
-- Name: b078691ad971
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
