-- Threat: !InfrastructureShared
-- Name: 1d789d28b741
-- Type: 21

if peattributes.isdll and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
