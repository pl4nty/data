-- Threat: !InfrastructureShared
-- Name: 71c9ca81291a
-- Type: 21

if peattributes.suspicious_image_version and pehdr.MajorImageVersion == 13 and pehdr.MinorImageVersion == 32 then
  mp.changedetectionname(805306482)
end
return mp.INFECTED
