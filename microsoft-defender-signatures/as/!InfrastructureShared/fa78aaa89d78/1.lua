-- Threat: !InfrastructureShared
-- Name: fa78aaa89d78
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image and mp.get_mpattribute("NID:Trojan:Win64/Zusy.AMS") then
  return mp.INFECTED
end
return mp.CLEAN
