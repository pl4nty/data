-- Threat: !InfrastructureShared
-- Name: 26292ba4693a
-- Type: 21

if mp.getfilesize() <= 80 then
  return mp.INFECTED
else
  return mp.LOWFI
end
return mp.CLEAN
