-- Threat: !InfrastructureShared
-- Name: 807862528fcd
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 3048000 then
  return mp.INFECTED
end
return mp.CLEAN
