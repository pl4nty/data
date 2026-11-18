-- Threat: !InfrastructureShared
-- Name: 707892ce74f0
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true and mp.getfilesize() == 7168 then
  return mp.INFECTED
end
return mp.CLEAN
