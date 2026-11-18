-- Threat: !InfrastructureShared
-- Name: 7f78eb25c855
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 3048000 then
  return mp.INFECTED
end
return mp.CLEAN
