-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3fb3b0db01ff\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = l_0_0.command_line
if l_0_1 then
  l_0_1 = (string.lower)(l_0_1)
  if (string.find)(l_0_1, ".msi", 1, true) then
    return mp.CLEAN
  end
  if (string.find)(l_0_1, "http://", 1, true) or (string.find)(l_0_1, "https://", 1, true) then
    local l_0_2, l_0_3 = (string.gsub)(l_0_1, "\t", "")
    local l_0_4, l_0_5 = (string.gsub)(l_0_1, "=", "")
    if l_0_3 >= 10 and l_0_5 >= 1 then
      return mp.INFECTED
    end
    if (string.find)(l_0_1, " -q", 1, true) or (string.find)(l_0_1, " /q", 1, true) then
      if l_0_1 >= 20 and l_0_5 >= 4 then
        return mp.INFECTED
      end
      if l_0_1 >= 4 then
        return mp.INFECTED
      end
    end
  end
end
do
  do
    do return mp.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end

