-- Threat: !InfrastructureShared
-- Name: e5407ed23dca
-- Type: 21

if mp.getfilesize() > 148000 and mp.getfilesize() < 162000 and epcode[1] == 232 and epcode[6] == 233 then
  return mp.INFECTED
end
return mp.CLEAN
