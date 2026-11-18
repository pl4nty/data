-- Threat: !InfrastructureShared
-- Name: 46293c877665
-- Type: 21

if mp.getfilesize() <= 512 then
  return mp.INFECTED
else
  return mp.LOWFI
end
return mp.CLEAN
