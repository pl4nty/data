-- Threat: !InfrastructureShared
-- Name: 15b3b28dad0d
-- Type: 21

local l_0_0 = bm.get_imagepath()
if type(l_0_0) ~= "string" or l_0_0:lower():match("([^\\]+)$") ~= "ykman.exe" then
  return mp.CLEAN
end
bm.add_related_string("YkmanProxyPort1080Evidence", "TCP destination port 1080; port heuristic, not SOCKS confirmation", bm.RelatedStringBMReport)
return mp.INFECTED
