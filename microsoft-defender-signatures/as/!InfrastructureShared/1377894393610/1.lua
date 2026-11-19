-- Threat: !InfrastructureShared
-- Name: 1377894393610
-- Type: 21

if mp.getfilesize() < 3140000 then
  return mp.INFECTED
end
return mp.CLEAN
