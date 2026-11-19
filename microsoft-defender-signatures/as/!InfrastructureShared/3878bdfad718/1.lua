-- Threat: !InfrastructureShared
-- Name: 3878bdfad718
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 20480000 then
  return mp.INFECTED
end
return mp.CLEAN
