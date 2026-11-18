-- Threat: !InfrastructureShared
-- Name: 15678f5412eb1
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == false and mp.getfilesize() < 5000000 then
  return mp.INFECTED
end
return mp.CLEAN
