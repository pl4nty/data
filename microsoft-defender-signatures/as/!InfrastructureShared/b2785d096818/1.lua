-- Threat: !InfrastructureShared
-- Name: b2785d096818
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
