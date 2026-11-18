-- Threat: !InfrastructureShared
-- Name: 227818e773b8
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.isdll == true and peattributes.amd64_image and mp.get_mpattribute("pea_no_security") and 14680064 < l_0_0 and l_0_0 < 16777216 then
  return mp.INFECTED
end
return mp.CLEAN
