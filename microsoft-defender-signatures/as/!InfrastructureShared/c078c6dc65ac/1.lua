-- Threat: !InfrastructureShared
-- Name: c078c6dc65ac
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 50000 then
  return mp.INFECTED
end
return mp.CLEAN
