-- Threat: !InfrastructureShared
-- Name: 907801e273cf
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
