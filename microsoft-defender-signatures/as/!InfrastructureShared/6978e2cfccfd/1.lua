-- Threat: !InfrastructureShared
-- Name: 6978e2cfccfd
-- Type: 21

if mp.getfilesize() < 1300000 then
  return mp.INFECTED
end
return mp.CLEAN
