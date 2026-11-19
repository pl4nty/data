-- Threat: !InfrastructureShared
-- Name: 77784cc3608f
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 300000 then
  return mp.INFECTED
end
return mp.CLEAN
