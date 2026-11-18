-- Threat: !InfrastructureShared
-- Name: 1e78d415e848
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true and mp.getfilesize() > 8000 then
  return mp.INFECTED
end
return mp.CLEAN
