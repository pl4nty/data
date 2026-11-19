-- Threat: !InfrastructureShared
-- Name: be41fdb30dbf
-- Type: 21

if mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
