-- Threat: !InfrastructureShared
-- Name: 8a785961ac2a
-- Type: 21

if peattributes.isdll and peattributes.ismsil and peattributes.no_exports and mp.getfilesize() < 5376 then
  return mp.INFECTED
end
return mp.CLEAN
