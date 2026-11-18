-- Threat: !InfrastructureShared
-- Name: 707878bc2ad3
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image and mp.get_mpattribute("NID:Win64/IcedId.PAG!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
