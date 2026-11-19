-- Threat: !InfrastructureShared
-- Name: 4a785bec14d8
-- Type: 21

if peattributes.x86_image == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
