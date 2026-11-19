-- Threat: !InfrastructureShared
-- Name: 3178a707df2a
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image and mp.get_mpattribute("NID:Win64/Nodestealer.MC!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
