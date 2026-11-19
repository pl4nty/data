-- Threat: !InfrastructureShared
-- Name: e17800a7ddc3
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 300000 then
  return mp.INFECTED
end
return mp.CLEAN
