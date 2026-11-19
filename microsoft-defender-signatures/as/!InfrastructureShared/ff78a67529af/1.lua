-- Threat: !InfrastructureShared
-- Name: ff78a67529af
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 100000 then
  return mp.INFECTED
end
return mp.CLEAN
