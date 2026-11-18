-- Threat: !InfrastructureShared
-- Name: 4c29af32ce02
-- Type: 21

if mp.getfilesize() <= 512 then
  return mp.INFECTED
else
  return mp.LOWFI
end
return mp.CLEAN
