-- Threat: !InfrastructureShared
-- Name: 8578d12820f9
-- Type: 21

if peattributes.suspicious_image_version and peattributes.suspicious_timestamp and peattributes.isdll and mp.getfilesize() < 237568 then
  if mp.HSTR_WEIGHT == 11 then
    return mp.SUSPICIOUS
  end
  pe.set_peattribute("hstr_exhaustive", true)
  pe.set_peattribute("deep_analysis", true)
  pe.reemulate()
end
return mp.CLEAN
