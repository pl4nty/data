-- Threat: !InfrastructureShared
-- Name: 37298292c4b5
-- Type: 21

if mp.getfilesize() <= 512 then
  return mp.INFECTED
end
return mp.CLEAN
