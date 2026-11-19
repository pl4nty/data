-- Threat: !InfrastructureShared
-- Name: 1b8cf88be016
-- Type: 21

if mp.getfilesize() > 3145728 then
  return mp.CLEAN
end
return mp.INFECTED
