-- Threat: !InfrastructureShared
-- Name: c078e0a7cb1a
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 20480000 then
  return mp.INFECTED
end
return mp.CLEAN
