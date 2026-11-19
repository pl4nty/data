-- Threat: !InfrastructureShared
-- Name: 2dcb3af3357c0
-- Type: 21

local l_0_0, l_0_1
local l_0_2 = versioning.GetOrgID()
if l_0_2 == nil or l_0_2 == "" or l_0_2:lower() ~= "19973957-59ce-41e6-b56b-815adf4e993a" and l_0_2:lower() ~= "0dde20f2-5621-4cfa-b3f5-b920800dd3b4" and l_0_2:lower() ~= "eae651fb-6b33-43bf-9f1b-5db8005d08c8" and l_0_2:lower() ~= "cbbbdbab-3a64-4985-8c50-73f760c0c1e8" and l_0_2:lower() ~= "a969413e-4834-4ade-8fac-e72c8644bad5" and l_0_2:lower() ~= "bc8263de-5f1d-4e3d-aa94-c57c016921e9" and l_0_2:lower() ~= "e7b4b5b5-cc27-4121-aabc-5efec589973d" and l_0_2:lower() ~= "9ff3ad62-771c-4e90-b459-128e2785ef42" and l_0_2:lower() ~= "dde274ce-9e7c-4295-ba15-509d02bd42cd" and l_0_2:lower() ~= "f7f68d47-e8c5-4553-a51e-dec472f31bfd" and l_0_2:lower() ~= "4ec5f50d-2073-4ecf-986c-0dcca43f933a" then
  return mp.CLEAN
end
if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil and this_sigattrlog[7].utf8p1 ~= "" then
  l_0_0 = this_sigattrlog[7].utf8p1
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p1 ~= nil and this_sigattrlog[8].utf8p1 ~= "" then
  l_0_0 = this_sigattrlog[8].utf8p1
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil and this_sigattrlog[9].utf8p1 ~= "" then
  l_0_0 = this_sigattrlog[9].utf8p1
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil and this_sigattrlog[2].utf8p2 ~= "" then
  l_0_1 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil and this_sigattrlog[3].utf8p2 ~= "" then
  l_0_1 = this_sigattrlog[3].utf8p2
end
local l_0_3, l_0_4 = l_0_0:match("([^/]+%.app.*)/([^/]+)$")
if l_0_1 ~= nil and l_0_4 ~= nil and l_0_3 ~= nil then
  if not string.find(l_0_4, ".asar", -5, true) then
    return mp.CLEAN
  end
  if string.find(l_0_1, l_0_4, 1, true) and string.find(l_0_1, l_0_3, 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
