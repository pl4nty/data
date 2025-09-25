-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\41d76c7ebc01\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 and l_0_0.image_path then
  local l_0_1 = (MpCommon.PathToWin32Path)(l_0_0.image_path)
  if not l_0_1 then
    return mp.CLEAN
  end
  l_0_1 = (string.lower)(l_0_1)
  local l_0_2, l_0_3 = pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentExecDropped", l_0_1)
  if l_0_2 and l_0_3 then
    for l_0_7,l_0_8 in ipairs(l_0_3) do
      if (string.find)(l_0_8.value, "UnsignedFile", 1, true) then
        local l_0_9, l_0_10 = safeJsonSerialize(l_0_3, 150, nil, true)
        local l_0_11 = MpCommon.BmTriggerSig
        local l_0_12 = l_0_0.ppid
        local l_0_13 = "SuspWerFaultSec_CMD"
        l_0_11(l_0_12, l_0_13, l_0_9 or l_0_10)
        l_0_11 = mp
        l_0_11 = l_0_11.INFECTED
        return l_0_11
      end
    end
  end
end
do
  l_0_1 = mp
  l_0_1 = l_0_1.CLEAN
  return l_0_1
end

