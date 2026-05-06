-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\39b3a4f2e36a\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched then
    local l_0_0 = nil
  end
  -- DECOMPILER ERROR at PC8: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC11: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 ~= nil and IsTacticObservedForPid(l_0_0, "SuspBunProcess") then
    return mp.INFECTED
  end
  return mp.CLEAN
end

