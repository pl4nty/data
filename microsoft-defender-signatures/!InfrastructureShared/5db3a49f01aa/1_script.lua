-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5db3a49f01aa\1_luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p1 == nil or (this_sigattrlog[2]).utf8p1 == "" or (this_sigattrlog[2]).utf8p2 == nil or (this_sigattrlog[2]).utf8p2 == "" then
  return mp.CLEAN
end
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = (this_sigattrlog[2]).utf8p1
if not SuspMacPathsToMonitor(l_0_3, true) and not (string.find)(l_0_3, "/Library/LaunchDaemons/", 1, true) and not (string.find)(l_0_3, "/Library/LaunchAgents/", 1, true) then
  return mp.CLEAN
end
if l_0_3:match("/%.[^/]+$") == nil then
  local l_0_4 = l_0_2
  do
    do
      if (string.find)(l_0_2, "/bin/mv", -3, true) ~= nil then
        local l_0_5 = (mp.GetParentProcInfo)()
        if l_0_5 ~= nil and l_0_5.image_path ~= nil then
          l_0_4 = l_0_5.image_path
        end
      end
      if SuspMacPathsToMonitor(l_0_4, true) or (string.find)(l_0_4, "/Users/[^/]+/Downloads/", 1, false) or (string.find)(l_0_4, "/Users/[^/]+/Documents/", 1, false) or (string.find)(l_0_4, "/Users/[^/]+/Desktop/", 1, false) then
        return mp.INFECTED
      end
      do return mp.INFECTED end
      return mp.CLEAN
    end
  end
end

