-- Threat: !InfrastructureShared
-- Name: 6978e06fec22
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
