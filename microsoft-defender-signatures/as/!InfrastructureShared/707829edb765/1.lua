-- Threat: !InfrastructureShared
-- Name: 707829edb765
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
