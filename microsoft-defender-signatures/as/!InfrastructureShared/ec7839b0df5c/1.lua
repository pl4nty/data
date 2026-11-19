-- Threat: !InfrastructureShared
-- Name: ec7839b0df5c
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
