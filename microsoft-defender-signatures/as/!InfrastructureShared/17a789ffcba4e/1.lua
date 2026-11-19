-- Threat: !InfrastructureShared
-- Name: 17a789ffcba4e
-- Type: 21

if peattributes.ismsil and peattributes.no_exports and mp.getfilesize() < 9472 then
  return mp.INFECTED
end
return mp.CLEAN
