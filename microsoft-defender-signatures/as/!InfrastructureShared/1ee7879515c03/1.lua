-- Threat: !InfrastructureShared
-- Name: 1ee7879515c03
-- Type: 21

if mp.getfilesize() < 1024000 then
  return mp.INFECTED
end
return mp.CLEAN
