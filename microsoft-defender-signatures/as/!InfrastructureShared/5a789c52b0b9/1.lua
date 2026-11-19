-- Threat: !InfrastructureShared
-- Name: 5a789c52b0b9
-- Type: 21

if peattributes.isdll and peattributes.ismsil and peattributes.no_exports and mp.getfilesize() < 4096 then
  return mp.INFECTED
end
return mp.CLEAN
