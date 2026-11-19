-- Threat: !InfrastructureShared
-- Name: 54781ba029d0
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
