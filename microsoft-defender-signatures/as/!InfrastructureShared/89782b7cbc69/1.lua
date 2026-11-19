-- Threat: !InfrastructureShared
-- Name: 89782b7cbc69
-- Type: 21

if peattributes.isdll and peattributes.ismsil and peattributes.no_exports and mp.getfilesize() < 4096 then
  return mp.INFECTED
end
return mp.CLEAN
