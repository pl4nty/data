-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\68d796e97509\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = l_0_1:lower()
l_0_1 = l_0_1:gsub("%^", "")
l_0_1 = l_0_1:gsub("\'", "")
l_0_1 = l_0_1:gsub("%s+", " ")
-- DECOMPILER ERROR at PC96: Unhandled construct in 'MakeBoolean' P3

if ((string.find)(l_0_1, "=mshta&set", 1, true) and (string.find)(l_0_1, "&call !", 1, true)) or not (string.find)(l_0_1, "=where p", 1, true) or not (string.find)(l_0_1, "in (where", 1, true) or (string.find)(l_0_1, "=rundll32&call", 1, true) and (string.find)(l_0_1, " \\\\", 1, true) then
  local l_0_2 = (mp.GetParentProcInfo)()
  if l_0_2 ~= nil then
    local l_0_3 = (string.lower)(l_0_2.image_path)
    if l_0_3:match("([^\\]+)$") == "explorer.exe" or l_0_2.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_2.ppid, true) then
      return mp.INFECTED
    else
      local l_0_4 = (mp.GetParentProcInfo)(l_0_2.ppid)
      if l_0_4 ~= nil and l_0_4.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_4.ppid, true) then
        return mp.INFECTED
      end
    end
  end
end
do
  return mp.CLEAN
end

