-- Threat: !InfrastructureShared
-- Name: 4f781dd25db3
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() > 1050000 then
  return mp.INFECTED
end
return mp.CLEAN
