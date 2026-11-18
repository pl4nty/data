-- Threat: !InfrastructureShared
-- Name: a540eb349ed4
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() > 11534336 then
  return mp.INFECTED
end
return mp.CLEAN
