-- Threat: !InfrastructureShared
-- Name: 2c2975c769b8
-- Type: 21

if mp.getfilesize() <= 1024 then
  return mp.INFECTED
end
return mp.CLEAN
