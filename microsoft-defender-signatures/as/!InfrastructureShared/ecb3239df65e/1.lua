-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\ecb3239df65e\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = nil, nil
local l_0_2 = nil
if (versioning.GetOrgID)() == nil or (versioning.GetOrgID)() == "" or ((versioning.GetOrgID)()):lower() ~= "19973957-59ce-41e6-b56b-815adf4e993a" and ((versioning.GetOrgID)()):lower() ~= "0dde20f2-5621-4cfa-b3f5-b920800dd3b4" and ((versioning.GetOrgID)()):lower() ~= "eae651fb-6b33-43bf-9f1b-5db8005d08c8" and ((versioning.GetOrgID)()):lower() ~= "cbbbdbab-3a64-4985-8c50-73f760c0c1e8" and ((versioning.GetOrgID)()):lower() ~= "a969413e-4834-4ade-8fac-e72c8644bad5" and ((versioning.GetOrgID)()):lower() ~= "bc8263de-5f1d-4e3d-aa94-c57c016921e9" and ((versioning.GetOrgID)()):lower() ~= "e7b4b5b5-cc27-4121-aabc-5efec589973d" and ((versioning.GetOrgID)()):lower() ~= "9ff3ad62-771c-4e90-b459-128e2785ef42" and ((versioning.GetOrgID)()):lower() ~= "dde274ce-9e7c-4295-ba15-509d02bd42cd" and ((versioning.GetOrgID)()):lower() ~= "f7f68d47-e8c5-4553-a51e-dec472f31bfd" then
  return mp.CLEAN
end
if not (this_sigattrlog[4]).matched or (this_sigattrlog[4]).utf8p2 == nil or (this_sigattrlog[4]).utf8p2 == "" then
  return mp.CLEAN
end
l_0_2 = (bm.get_imagepath)()
if IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = nil
if (bm.get_current_process_startup_info)() == nil then
  return mp.CLEAN
end
local l_0_4 = nil
if IsExcludedByCmdlineMacOS(((bm.get_current_process_startup_info)()).command_line) then
  return mp.CLEAN
end
l_0_3 = (this_sigattrlog[4]).utf8p2
if IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_2) and ((string.find)(l_0_3, "^/Users/[^/]+/Desktop/[^/]+$", 1, false) or (string.find)(l_0_3, "^/Users/[^/]+/Documents/[^/]+$", 1, false) or (string.find)(l_0_3, "^/Users/[^/]+/Downloads/[^/]+$", 1, false) or (string.find)(l_0_3, "^/private/tmp/[^/]+$", 1, false) or (string.find)(l_0_3, "^/Users/[^/]+/Desktop/[^/]+/[^/]+$", 1, false) or (string.find)(l_0_3, "^/Users/[^/]+/Documents/[^/]+/[^/]+$", 1, false) or (string.find)(l_0_3, "^/Users/[^/]+/Downloads/[^/]+/[^/]+$", 1, false) or (string.find)(l_0_3, "^/private/tmp/[^/]+/[^/]+$", 1, false)) then
  (bm.trigger_sig)("BM_UnsignedProcCreatedUnsignedFile", l_0_3)
  return mp.INFECTED
end
return mp.CLEAN

