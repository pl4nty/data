-- Threat: !InfrastructureShared
-- Name: 5c7802bcc990
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 50000 then
  return mp.INFECTED
end
return mp.CLEAN
