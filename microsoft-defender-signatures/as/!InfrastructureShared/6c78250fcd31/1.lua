-- Threat: !InfrastructureShared
-- Name: 6c78250fcd31
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 900000 then
  return mp.INFECTED
end
return mp.CLEAN
