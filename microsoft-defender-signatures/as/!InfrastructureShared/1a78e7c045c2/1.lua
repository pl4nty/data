-- Threat: !InfrastructureShared
-- Name: 1a78e7c045c2
-- Type: 21

if mp.getfilesize() >= 130560 and mp.getfilesize() <= 136192 then
  return mp.INFECTED
end
return mp.CLEAN
