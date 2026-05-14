-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d0d7eecc0487\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil then
  local l_0_1 = false
  local l_0_2 = (string.lower)(l_0_0.image_path)
  if l_0_2:match("([^\\]+)$") == "explorer.exe" or l_0_0.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_0.ppid, true) then
    l_0_1 = true
  else
    local l_0_3 = (mp.GetParentProcInfo)(l_0_0.ppid)
    if l_0_3 ~= nil and l_0_3.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_3.ppid, true) then
      l_0_1 = true
    end
  end
  do
    if not l_0_1 then
      return mp.CLEAN
    end
    local l_0_4 = (mp.GetScannedPPID)()
    local l_0_5 = (mp.GetProcessCommandLine)(l_0_4)
    if l_0_5 == nil then
      return mp.CLEAN
    end
    do
      local l_0_6 = l_0_5:match("\\\\[%w%-%.]+%.([%a@]+)\\")
      if not l_0_6 then
        return mp.CLEAN
      end
      l_0_6 = l_0_6:gsub("@.*$", "")
      if isSuspTLD(l_0_6) or (string.find)(l_0_6, "wiki", 1, true) then
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
end

