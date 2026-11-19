-- Threat: !InfrastructureShared
-- Name: 9cb3d2991213
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1, l_0_2
local l_0_3 = versioning.GetOrgID()
if l_0_3 == nil or l_0_3 == "" or l_0_3:lower() ~= "19973957-59ce-41e6-b56b-815adf4e993a" and l_0_3:lower() ~= "0dde20f2-5621-4cfa-b3f5-b920800dd3b4" and l_0_3:lower() ~= "eae651fb-6b33-43bf-9f1b-5db8005d08c8" and l_0_3:lower() ~= "cbbbdbab-3a64-4985-8c50-73f760c0c1e8" and l_0_3:lower() ~= "a969413e-4834-4ade-8fac-e72c8644bad5" and l_0_3:lower() ~= "bc8263de-5f1d-4e3d-aa94-c57c016921e9" and l_0_3:lower() ~= "e7b4b5b5-cc27-4121-aabc-5efec589973d" and l_0_3:lower() ~= "9ff3ad62-771c-4e90-b459-128e2785ef42" and l_0_3:lower() ~= "dde274ce-9e7c-4295-ba15-509d02bd42cd" and l_0_3:lower() ~= "f7f68d47-e8c5-4553-a51e-dec472f31bfd" and l_0_3:lower() ~= "4ec5f50d-2073-4ecf-986c-0dcca43f933a" then
  return mp.CLEAN
end
if not this_sigattrlog[4].matched or this_sigattrlog[4].utf8p1 == nil or this_sigattrlog[4].utf8p1 == "" or this_sigattrlog[4].utf8p2 == nil or this_sigattrlog[4].utf8p2 == "" then
  return mp.CLEAN
end
l_0_0 = bm.get_imagepath()
if IsExcludedByImagePathMacOS(l_0_0) then
  return mp.CLEAN
end
local l_0_4 = bm.get_current_process_startup_info()
if l_0_4 == nil then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS(l_0_4.command_line) then
  return mp.CLEAN
end
l_0_1 = this_sigattrlog[4].utf8p1:match("([^/]+)%s*%d*$")
l_0_2 = this_sigattrlog[4].utf8p2:match("([^/]+)%s*%d*$")
if l_0_1 ~= nil and l_0_2 ~= nil and l_0_1 ~= "" and l_0_1:lower() == l_0_2:lower() then
  return mp.INFECTED
end
return mp.CLEAN
