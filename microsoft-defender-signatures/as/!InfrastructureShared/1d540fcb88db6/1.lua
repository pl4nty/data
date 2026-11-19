-- Threat: !InfrastructureShared
-- Name: 1d540fcb88db6
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 10240 and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
