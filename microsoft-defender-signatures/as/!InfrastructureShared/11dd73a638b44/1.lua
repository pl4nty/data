-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\11dd73a638b44\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil then
  local l_0_1 = false
  local l_0_2 = (string.lower)(l_0_0.image_path)
  if (string.find)(l_0_2, "\\explorer.exe", 1, true) then
    l_0_1 = true
  end
  if l_0_0.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_0.ppid, true) then
    l_0_1 = true
  end
  local l_0_3 = (mp.GetParentProcInfo)(l_0_0.ppid)
  if l_0_3 ~= nil and l_0_3.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_3.ppid, true) then
    l_0_1 = true
  end
  if not l_0_1 then
    return mp.CLEAN
  end
  if (mp.get_mpattribute)("MpCmdLineFoundB64") then
    return mp.INFECTED
  end
  local l_0_4 = (mp.GetScannedPPID)()
  if l_0_4 == "" or l_0_4 == nil then
    return mp.CLEAN
  end
  local l_0_5 = (mp.GetProcessCommandLine)(l_0_4)
  if not l_0_5 then
    return mp.CLEAN
  end
  l_0_5 = (string.lower)(l_0_5)
  l_0_5 = (string.gsub)(l_0_5, "%^", "")
  if (string.find)(l_0_5, "iwr ", 1, true) or (string.find)(l_0_5, "iwr(", 1, true) or (string.find)(l_0_5, "irm ", 1, true) or (string.find)(l_0_5, "irm(", 1, true) or (string.find)(l_0_5, "curl", 1, true) or (string.find)(l_0_5, "wget", 1, true) or (string.find)(l_0_5, "http", 1, true) or (string.find)(l_0_5, ".gettype(", 1, true) or (string.find)(l_0_5, ").content", 1, true) or (string.find)(l_0_5, " /c set ", 1, true) then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

