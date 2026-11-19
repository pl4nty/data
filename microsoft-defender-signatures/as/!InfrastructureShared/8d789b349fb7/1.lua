-- Threat: !InfrastructureShared
-- Name: 8d789b349fb7
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 10000 then
  return mp.INFECTED
end
return mp.CLEAN
