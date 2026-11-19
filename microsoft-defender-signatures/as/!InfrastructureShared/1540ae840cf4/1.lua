-- Threat: !InfrastructureShared
-- Name: 1540ae840cf4
-- Type: 21

if not peattributes.hasappendeddata then
  local l_0_0 = pehdr.NumberOfSections
  if pesecs[l_0_0].SizeOfRawData > 3670016 then
    mp.set_mpattribute("AutoItIgnoreMaxSizes")
    return mp.INFECTED
  end
end
return mp.CLEAN
