-- Threat: !InfrastructureShared
-- Name: 8878dd6a0fee
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image and mp.get_mpattribute("NID:Win64/IcedID.MT!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
