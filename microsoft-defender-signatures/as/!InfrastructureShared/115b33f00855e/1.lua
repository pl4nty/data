-- Threat: !InfrastructureShared
-- Name: 115b33f00855e
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0, l_0_1
local l_0_2 = versioning.GetOrgID()
if l_0_2 == nil or l_0_2 == "" or l_0_2:lower() ~= "19973957-59ce-41e6-b56b-815adf4e993a" and l_0_2:lower() ~= "0dde20f2-5621-4cfa-b3f5-b920800dd3b4" and l_0_2:lower() ~= "eae651fb-6b33-43bf-9f1b-5db8005d08c8" and l_0_2:lower() ~= "cbbbdbab-3a64-4985-8c50-73f760c0c1e8" and l_0_2:lower() ~= "a969413e-4834-4ade-8fac-e72c8644bad5" and l_0_2:lower() ~= "bc8263de-5f1d-4e3d-aa94-c57c016921e9" and l_0_2:lower() ~= "e7b4b5b5-cc27-4121-aabc-5efec589973d" and l_0_2:lower() ~= "9ff3ad62-771c-4e90-b459-128e2785ef42" and l_0_2:lower() ~= "dde274ce-9e7c-4295-ba15-509d02bd42cd" and l_0_2:lower() ~= "f7f68d47-e8c5-4553-a51e-dec472f31bfd" and l_0_2:lower() ~= "4ec5f50d-2073-4ecf-986c-0dcca43f933a" then
  return mp.CLEAN
end
if not this_sigattrlog[5].matched or this_sigattrlog[5].utf8p2 == nil or this_sigattrlog[5].utf8p2 == "" then
  return mp.CLEAN
end
l_0_0 = bm.get_imagepath()
if IsExcludedByImagePathMacOS(l_0_0) then
  return mp.CLEAN
end
local l_0_3 = bm.get_current_process_startup_info()
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = l_0_3.command_line
if IsExcludedByCmdlineMacOS(l_0_4) then
  return mp.CLEAN
end
l_0_1 = this_sigattrlog[5].utf8p2
if IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_0) and (string.find(l_0_1, "^/Users/[^/]+/Desktop/[^/]+$", 1, false) or string.find(l_0_1, "^/Users/[^/]+/Documents/[^/]+$", 1, false) or string.find(l_0_1, "^/Users/[^/]+/Downloads/[^/]+$", 1, false) or string.find(l_0_1, "^/private/tmp/[^/]+$", 1, false) or string.find(l_0_1, "^/Users/[^/]+/Desktop/[^/]+/[^/]+$", 1, false) or string.find(l_0_1, "^/Users/[^/]+/Documents/[^/]+/[^/]+$", 1, false) or string.find(l_0_1, "^/Users/[^/]+/Downloads/[^/]+/[^/]+$", 1, false) or string.find(l_0_1, "^/private/tmp/[^/]+/[^/]+$", 1, false)) then
  bm.trigger_sig("BM_UnsignedProcCreatedUnsignedFile", l_0_1)
  return mp.INFECTED
end
return mp.CLEAN
