-- Threat: !InfrastructureShared
-- Name: 4978a5b589f1
-- Type: 21

if peattributes.epscn_writable and peattributes.headerchecksum0 and peattributes.no_decription and peattributes.suspicious_image_version then
  return mp.INFECTED
end
return mp.CLEAN
