-- Threat: !InfrastructureShared
-- Name: 1107877621ca4
-- Type: 21

if mp.getfilesize() < 3735552 then
  return mp.INFECTED
end
return mp.CLEAN
