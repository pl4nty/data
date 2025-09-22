-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\22ab39297312b\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if l_0_1:find("--user-data-dir=/var/folders", 1, true) or l_0_1:find("--load-extension=", 1, true) or l_0_1:find("JetBrains/IntelliJIdea", 1, true) or l_0_1:find("/Library/Caches/ms-playwright/mcp-chrome", 1, true) or l_0_1:find("--user-data-dir=/private/var/folders", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED

