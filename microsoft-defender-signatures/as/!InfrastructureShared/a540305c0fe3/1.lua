-- Threat: !InfrastructureShared
-- Name: a540305c0fe3
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll and mp.getfilesize() < 8192 then
  return mp.INFECTED
end
return mp.CLEAN
