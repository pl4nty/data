-- Threat: !InfrastructureShared
-- Name: 15b3b28dad0d
-- Type: 21

local l_0_0 = versioning.GetOrgID()
local l_0_1 = 100
if type(l_0_0) == "string" then
  l_0_0 = l_0_0:lower()
  if l_0_0 == "26e8b179-9fbe-40fd-8f34-37cdee8c4766" or l_0_0 == "e6e2b814-cd64-4ac3-9e16-91753ff30617" or l_0_0 == "bcfa1838-fccc-4999-9d5b-5ec1ac1a4776" then
    l_0_1 = 25000
  end
end
if versioning.IsSampled(l_0_1, false, false, false) ~= true then
  return mp.CLEAN
end
local l_0_2 = bm.get_imagepath()
if type(l_0_2) ~= "string" or l_0_2:lower():match("([^\\]+)$") ~= "ykman.exe" then
  return mp.CLEAN
end
bm.add_related_string("YkmanProxyPort1080Evidence", "TCP destination port 1080; port heuristic, not SOCKS confirmation", bm.RelatedStringBMReport)
return mp.INFECTED
