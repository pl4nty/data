-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\14eb3d996dd23\1.luac 

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
if l_0_2:find("/tmp/docker-desktop-privileged", 1, true) or l_0_2:find("therealtomrose/citrix-workspace-killer/master/stop_citrix.sh", 1, true) or l_0_2:find("https://cdn.appcatalog.cloud/install_app_catalog.zsh", 1, true) or l_0_2:find("/opt/homebrew/bin/openssl%s+pkeyutl%.ssh/auth/client_private%.pem", 1, false) then
  return mp.CLEAN
end
if l_0_2:find("echo.*%|%s+base64%s+-d", 1, false) or l_0_2:find("echo.*%|%s+base64%s+--decode", 1, false) or l_0_2:find("echo.*%|%s+base64%s+-D", 1, false) or l_0_2:find("curl.*%|%s+bash", 1, false) or l_0_2:find("curl.*%|%s+sh", 1, false) or l_0_2:find("curl.*%|%s+zsh", 1, false) or l_0_2:find("tail%s+-c.*%|%s+funzip", 1, false) or l_0_2:find("echo.*%|%s+xxd", 1, false) then
  return mp.INFECTED
end
return mp.CLEAN

