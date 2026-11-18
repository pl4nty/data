-- Threat: !InfrastructureShared
-- Name: 3778cae4b180
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image and mp.get_mpattribute("NID:Trojan:Win64/RedLine.AL!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
