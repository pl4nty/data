-- Threat: !InfrastructureShared
-- Name: 282914c75b7f
-- Type: 21

if mp.getfilesize() < 51200 then
  return mp.INFECTED
end
return mp.CLEAN
