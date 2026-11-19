-- Threat: !InfrastructureShared
-- Name: c97836ad5f91
-- Type: 21

if mp.getfilesize() > 301989888 and mp.getfilesize() < 352321536 then
  return mp.INFECTED
end
return mp.CLEAN
