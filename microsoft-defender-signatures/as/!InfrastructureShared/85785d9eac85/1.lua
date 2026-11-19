-- Threat: !InfrastructureShared
-- Name: 85785d9eac85
-- Type: 21

if mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
