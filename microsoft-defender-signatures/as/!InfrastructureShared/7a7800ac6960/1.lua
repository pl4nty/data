-- Threat: !InfrastructureShared
-- Name: 7a7800ac6960
-- Type: 21

if peattributes.ismsil and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
