-- Threat: !InfrastructureShared
-- Name: 1b0784a3b99f4
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image and mp.get_mpattribute("NID:Win64/IcedID.MT!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
