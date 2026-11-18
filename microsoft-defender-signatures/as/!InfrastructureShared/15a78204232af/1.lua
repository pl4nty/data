-- Threat: !InfrastructureShared
-- Name: 15a78204232af
-- Type: 21

if peattributes.ismsil and mp.getfilesize() < 50000 then
  return mp.INFECTED
end
return mp.CLEAN
