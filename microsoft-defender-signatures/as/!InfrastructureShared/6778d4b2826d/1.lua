-- Threat: !InfrastructureShared
-- Name: 6778d4b2826d
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 720896 <= l_0_0 and l_0_0 <= 851968 and peattributes.amd64_image and peattributes.headerchecksum0 and peattributes.suspicious_linker_version then
  return mp.INFECTED
end
return mp.CLEAN
