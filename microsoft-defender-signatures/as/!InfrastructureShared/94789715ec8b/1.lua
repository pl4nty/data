-- Threat: !InfrastructureShared
-- Name: 94789715ec8b
-- Type: 21

if peattributes.isvbnative and peattributes.dirty_wx_branch and peattributes.hstr_exhaustive and peattributes.hasappendeddata then
  return mp.INFECTED
end
if not peattributes.suspicious_timestamp and not peattributes.suspicious_image_version then
  return mp.CLEAN
end
return mp.INFECTED
