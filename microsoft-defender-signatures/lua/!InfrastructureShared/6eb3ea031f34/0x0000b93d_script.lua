-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\6eb3ea031f34\0x0000b93d_luac 

-- params : ...
-- function num : 0
local l_0_0 = nil
local l_0_1, l_0_2 = , (bm.get_process_relationships)()
for l_0_6,l_0_7 in ipairs(l_0_2) do
  local l_0_3 = nil
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R7 in 'UnsetPending'

  l_0_1 = R7_PC7.ppid
  if l_0_1 and IsDetectionThresholdMet(l_0_1) and (IsTacticObservedForPid(l_0_1, "credentialdumping") or IsTacticObservedForPid(l_0_1, "impair_recovery")) then
    return mp.INFECTED
  end
end
return mp.CLEAN

