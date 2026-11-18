-- Threat: !InfrastructureShared
-- Name: 5578c1be2469
-- Type: 21

if peattributes.isdll and peattributes.x86_image and peattributes.hasexports and peattributes.suspicious_linker_version then
  return mp.INFECTED
end
return mp.CLEAN
