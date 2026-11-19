-- Threat: !InfrastructureShared
-- Name: 13478a742037f
-- Type: 21

if epcode[1] == 232 and epcode[6] == 233 and mp.getfilesize() > 94208 and mp.getfilesize() < 196608 then
  return mp.INFECTED
end
return mp.CLEAN
