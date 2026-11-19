-- Threat: !InfrastructureShared
-- Name: 91782e17b621
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
