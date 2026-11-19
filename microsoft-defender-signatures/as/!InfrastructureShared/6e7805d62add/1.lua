-- Threat: !InfrastructureShared
-- Name: 6e7805d62add
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
