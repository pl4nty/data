-- Threat: !InfrastructureShared
-- Name: 12678348ba7da
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true and mp.getfilesize() < 75792 then
  return mp.INFECTED
end
return mp.CLEAN
