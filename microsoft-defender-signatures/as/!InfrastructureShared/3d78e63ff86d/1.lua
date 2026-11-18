-- Threat: !InfrastructureShared
-- Name: 3d78e63ff86d
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.isdll == true and peattributes.amd64_image and mp.get_mpattribute("pea_no_security") and 12582912 < l_0_0 and l_0_0 < 15728640 then
  return mp.INFECTED
end
return mp.CLEAN
