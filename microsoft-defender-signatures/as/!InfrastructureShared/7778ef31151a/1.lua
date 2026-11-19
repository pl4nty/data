-- Threat: !InfrastructureShared
-- Name: 7778ef31151a
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
