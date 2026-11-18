-- Threat: !InfrastructureShared
-- Name: 11f78316174fa
-- Type: 21

if mp.getfilesize() < 3014656 then
  return mp.INFECTED
end
return mp.CLEAN
