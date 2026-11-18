-- Threat: !InfrastructureShared
-- Name: 46782edceb02
-- Type: 21

if peattributes.isdll and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
