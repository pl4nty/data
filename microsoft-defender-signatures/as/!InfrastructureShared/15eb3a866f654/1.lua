-- Threat: !InfrastructureShared
-- Name: 15eb3a866f654
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1, l_0_2
local l_0_3 = versioning.GetOrgID()
if l_0_3 == nil or l_0_3 == "" or l_0_3:lower() ~= "19973957-59ce-41e6-b56b-815adf4e993a" and l_0_3:lower() ~= "0dde20f2-5621-4cfa-b3f5-b920800dd3b4" and l_0_3:lower() ~= "eae651fb-6b33-43bf-9f1b-5db8005d08c8" and l_0_3:lower() ~= "cbbbdbab-3a64-4985-8c50-73f760c0c1e8" and l_0_3:lower() ~= "a969413e-4834-4ade-8fac-e72c8644bad5" and l_0_3:lower() ~= "bc8263de-5f1d-4e3d-aa94-c57c016921e9" and l_0_3:lower() ~= "e7b4b5b5-cc27-4121-aabc-5efec589973d" and l_0_3:lower() ~= "9ff3ad62-771c-4e90-b459-128e2785ef42" and l_0_3:lower() ~= "dde274ce-9e7c-4295-ba15-509d02bd42cd" and l_0_3:lower() ~= "f7f68d47-e8c5-4553-a51e-dec472f31bfd" and l_0_3:lower() ~= "4ec5f50d-2073-4ecf-986c-0dcca43f933a" then
  return mp.CLEAN
end
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil and this_sigattrlog[3].utf8p2 ~= "" then
  l_0_1 = this_sigattrlog[3].utf8p2
  l_0_0 = this_sigattrlog[3].utf8p1
  l_0_2 = this_sigattrlog[3].ppid
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil and this_sigattrlog[4].utf8p2 ~= "" then
  l_0_1 = this_sigattrlog[4].utf8p2
  l_0_0 = this_sigattrlog[4].utf8p1
  l_0_2 = this_sigattrlog[4].ppid
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil and this_sigattrlog[5].utf8p2 ~= "" then
  l_0_1 = this_sigattrlog[5].utf8p2
  l_0_0 = this_sigattrlog[5].utf8p1
  l_0_2 = this_sigattrlog[5].ppid
end
if l_0_0 ~= nil and l_0_1 ~= nil and is_valid_ip(l_0_1) == nil and string.find(l_0_1, "/bin/bash", 1, true) == nil and string.find(l_0_1, "/bin/sh", 1, true) == nil and string.find(l_0_1, "/bin/zsh", 1, true) == nil and string.find(l_0_1, "sh -i", 1, true) == nil then
  return mp.CLEAN
end
local l_0_4 = bm.get_imagepath()
if l_0_4 ~= nil and l_0_4 ~= "" and l_0_2 ~= nil then
  bm.trigger_sig("GenericReverseShell", l_0_4, l_0_2)
  return mp.INFECTED
end
return mp.CLEAN
