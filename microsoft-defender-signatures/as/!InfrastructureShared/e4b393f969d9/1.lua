-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e4b393f969d9\1.luac 

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
if l_0_2:find("/usr/local/share/dotnet/sdk/", 1, true) or l_0_2:find("/libexec/bin/dart", 1, true) or l_0_2:find("/Applications/RebootControl.app/Contents/MacOS/", 1, true) or l_0_2:find("dotnet run", 1, true) or l_0_2:find("dotnet build", 1, true) or l_0_2:find("/Applications/anaconda3/_conda install", 1, true) or l_0_2:find("Scripts/com.omnissa.horizon.client.mac", 1, true) then
  return mp.CLEAN
end
do
  if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 ~= nil and (this_sigattrlog[5]).utf8p2 ~= "" then
    local l_0_3 = (this_sigattrlog[5]).utf8p2
    if l_0_3:find(" /Applications/", 1, true) or l_0_3:find(" /tmp/", 1, true) or l_0_3:find(" /private/tmp/", 1, true) or l_0_3:find(" /Users/Shared/", 1, true) then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

