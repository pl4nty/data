-- Threat: !InfrastructureShared
-- Name: 5f780d5453a5
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image and mp.getfilesize() < 468744 then
  return mp.INFECTED
end
return mp.CLEAN
