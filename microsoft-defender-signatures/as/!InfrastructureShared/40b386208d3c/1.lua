-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\40b386208d3c\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
do
  if not isnull(l_0_0) and not isnull(l_0_0.command_line) then
    local l_0_1 = (string.lower)(l_0_0.command_line)
    if (string.find)(l_0_1, "magicinfo", 1, true) and (string.find)(l_0_1, "tomcat.exe", 1, true) then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

