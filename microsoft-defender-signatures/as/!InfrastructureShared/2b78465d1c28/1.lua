-- Threat: !InfrastructureShared
-- Name: 2b78465d1c28
-- Type: 21
-- Flags: 1

if peattributes.suspicious_image_version and peattributes.suspicious_timestamp and peattributes.isdll and mp.getfilesize() < 319488 and (pesecs[3].Name == ".ydata" or pesecs[3].Name == ".hdata" or pesecs[3].Name == ".idata") then
  return mp.SUSPICIOUS
end
return mp.LOWFI
