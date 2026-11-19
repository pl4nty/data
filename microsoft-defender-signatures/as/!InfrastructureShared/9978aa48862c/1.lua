-- Threat: !InfrastructureShared
-- Name: 9978aa48862c
-- Type: 21

if mp.getfilesize() >= 959488 and mp.getfilesize() <= 961024 then
  return mp.INFECTED
end
return mp.CLEAN
