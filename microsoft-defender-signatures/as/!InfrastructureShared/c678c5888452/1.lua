-- Threat: !InfrastructureShared
-- Name: c678c5888452
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 1024000 then
  return mp.INFECTED
end
return mp.CLEAN
