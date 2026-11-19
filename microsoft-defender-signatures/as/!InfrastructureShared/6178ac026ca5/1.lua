-- Threat: !InfrastructureShared
-- Name: 6178ac026ca5
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 300000 then
  return mp.INFECTED
end
return mp.CLEAN
