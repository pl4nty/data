-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c2b38d6a3735\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
do
  if l_0_0 ~= nil and l_0_0.command_line ~= nil then
    local l_0_1 = (string.lower)(l_0_0.command_line)
    if l_0_1:find("gpsvc", 1, true) or l_0_1:find("schedule", 1, true) then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

