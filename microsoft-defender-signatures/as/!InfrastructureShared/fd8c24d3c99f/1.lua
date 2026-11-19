-- Threat: !InfrastructureShared
-- Name: fd8c24d3c99f
-- Type: 21
-- Flags: 1

if mp.getfilesize() < 5000000 then
  return mp.INFECTED
end
return mp.CLEAN
