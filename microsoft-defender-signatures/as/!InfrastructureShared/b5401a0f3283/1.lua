-- Threat: !InfrastructureShared
-- Name: b5401a0f3283
-- Type: 21

if mp.getfilesize() < 1536000 then
  return mp.INFECTED
end
return mp.CLEAN
