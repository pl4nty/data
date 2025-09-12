-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84b3dbcdb35b\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
if l_0_0 == nil or l_0_0 == "" or l_0_0:lower() ~= "19973957-59ce-41e6-b56b-815adf4e993a" and l_0_0:lower() ~= "0dde20f2-5621-4cfa-b3f5-b920800dd3b4" and l_0_0:lower() ~= "eae651fb-6b33-43bf-9f1b-5db8005d08c8" and l_0_0:lower() ~= "cbbbdbab-3a64-4985-8c50-73f760c0c1e8" and l_0_0:lower() ~= "a969413e-4834-4ade-8fac-e72c8644bad5" and l_0_0:lower() ~= "bc8263de-5f1d-4e3d-aa94-c57c016921e9" and l_0_0:lower() ~= "e7b4b5b5-cc27-4121-aabc-5efec589973d" and l_0_0:lower() ~= "9ff3ad62-771c-4e90-b459-128e2785ef42" and l_0_0:lower() ~= "dde274ce-9e7c-4295-ba15-509d02bd42cd" and l_0_0:lower() ~= "f7f68d47-e8c5-4553-a51e-dec472f31bfd" then
  return mp.CLEAN
end
local l_0_1 = (bm.get_current_process_startup_info)()
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = l_0_1.command_line
local l_0_3 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_2) or IsExcludedByImagePathMacOS(l_0_3) then
  return mp.CLEAN
end
local l_0_4 = nil
if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil and (this_sigattrlog[3]).utf8p2 ~= "" then
  l_0_4 = (this_sigattrlog[3]).utf8p2
else
  return mp.CLEAN
end
if l_0_4 == "" or l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = nil
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[2]).utf8p2 ~= "" then
  l_0_5 = (this_sigattrlog[2]).utf8p2
else
  return mp.CLEAN
end
if l_0_5 == "" or l_0_5 == nil then
  return mp.CLEAN
end
if (string.find)(l_0_4, "local/bin/telepresence", 1, true) or (string.find)(l_0_4, "local/bin/ludus", 1, true) then
  return mp.CLEAN
end
do
  if (string.find)(l_0_5, "xattr -c", 1, true) or (string.find)(l_0_5, "xattr -d", 1, true) or (string.find)(l_0_5, "xattr -rc", 1, true) or (string.find)(l_0_5, "xattr -rd", 1, true) then
    local l_0_6 = l_0_4:match("([^/]+)$")
    if l_0_6 ~= "" and l_0_6 ~= nil and (string.find)(l_0_5, l_0_6, 1, true) then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

