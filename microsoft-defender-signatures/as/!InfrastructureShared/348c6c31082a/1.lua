-- Threat: !InfrastructureShared
-- Name: 348c6c31082a
-- Type: 21

if mp.getfilesize() > 3145728 then
  return mp.CLEAN
end
return mp.INFECTED
