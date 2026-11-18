-- Threat: !InfrastructureShared
-- Name: 40788fff3a4d
-- Type: 21

if peattributes.suspicious_image_version and peattributes.suspicious_timestamp and peattributes.isdll and mp.getfilesize() < 325888 then
  pe.reemulate()
  return mp.INFECTED
end
return mp.CLEAN
