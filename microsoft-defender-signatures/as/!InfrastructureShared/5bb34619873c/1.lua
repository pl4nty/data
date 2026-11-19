-- Threat: !InfrastructureShared
-- Name: 5bb34619873c
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil and this_sigattrlog[2].utf8p2 ~= "" then
  l_0_0 = this_sigattrlog[2].utf8p2
end
local l_0_1 = bm.get_imagepath()
if l_0_1 ~= nil and l_0_1 ~= "" and l_0_0 ~= nil then
  if l_0_1:find("/private/tmp/", 1, true) ~= 1 and l_0_1:find("/Users/Shared/", 1, true) ~= 1 and l_0_1:find("/tmp/", 1, true) ~= 1 and l_0_1:find("/Library/Caches/", 1, true) == nil and l_0_1:find("^/Users/[^/]+/Downloads/[^/]+$", 1, false) ~= 1 then
    return mp.CLEAN
  end
  local l_0_2 = versioning.GetOrgID()
  if l_0_2 ~= nil and l_0_2 ~= "" and l_0_2:lower() == "2d1d3ad2-ead9-4243-95a6-8897fcc65ea7" then
    return mp.INFECTED
  end
end
return mp.CLEAN
