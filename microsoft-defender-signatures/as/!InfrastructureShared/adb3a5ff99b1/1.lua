-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\adb3a5ff99b1\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
local l_0_1 = (bm.get_current_process_startup_info)()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1.command_line
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS(l_0_2) or IsExcludedByImagePathMacOS(l_0_0) then
  return mp.CLEAN
end
local l_0_3 = nil
if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil and (this_sigattrlog[3]).utf8p2 ~= "" then
  l_0_3 = (this_sigattrlog[3]).utf8p2
else
  if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 ~= nil and (this_sigattrlog[4]).utf8p2 ~= "" then
    l_0_3 = (this_sigattrlog[4]).utf8p2
  end
end
if l_0_3 ~= nil and l_0_3 ~= "" then
  if l_0_3:find("/private/tmp/", 1, true) ~= 1 and l_0_3:find("/Users/Shared/", 1, true) ~= 1 and l_0_3:find("/tmp/", 1, true) ~= 1 and l_0_3:find("/Library/Caches/", 1, true) == nil and l_0_3:find("^/Users/[^/]+/Downloads/[^/]+$", 1, false) ~= 1 then
    return mp.CLEAN
  end
  if IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_3) then
    local l_0_4 = (versioning.GetOrgID)()
    if l_0_4 ~= nil and l_0_4 ~= "" and l_0_4:lower() == "2d1d3ad2-ead9-4243-95a6-8897fcc65ea7" then
      if (sysio.IsFileExists)(l_0_3) then
        (bm.add_threat_file)(l_0_3)
      end
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

