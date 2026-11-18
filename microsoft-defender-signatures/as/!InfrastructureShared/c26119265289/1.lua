-- Threat: !InfrastructureShared
-- Name: c26119265289
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() >= 614400 and mp.getfilesize() <= 1536000 then
  return mp.INFECTED
end
return mp.CLEAN
