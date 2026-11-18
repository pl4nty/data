-- Threat: !InfrastructureShared
-- Name: 2078360e75a8
-- Type: 21

if peattributes.isdll == true and mp.getfilesize() < 10000 and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
