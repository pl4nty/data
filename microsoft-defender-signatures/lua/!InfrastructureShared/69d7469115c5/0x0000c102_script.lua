-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\69d7469115c5\0x0000c102_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil and l_0_0.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_0.ppid, true) then
  local l_0_1 = (mp.GetScannedPPID)()
  if l_0_1 == "" or l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = (mp.GetProcessCommandLine)(l_0_1)
  if not l_0_2 then
    return mp.CLEAN
  end
  l_0_2 = (string.lower)(l_0_2)
  local l_0_3, l_0_4 = extract_urls(l_0_2)
  if isnull(l_0_4) then
    return mp.CLEAN
  end
  for l_0_8,l_0_9 in ipairs(l_0_4) do
    local l_0_10 = split(l_0_9, "%.")
    if not l_0_10 then
      return mp.CLEAN
    end
    local l_0_11 = "." .. tostring(l_0_10[#l_0_10])
    if not l_0_11 then
      return mp.CLEAN
    end
    if isSuspTLD(l_0_11) then
      return mp.INFECTED
    end
  end
end
do
  l_0_1 = mp
  l_0_1 = l_0_1.CLEAN
  return l_0_1
end

