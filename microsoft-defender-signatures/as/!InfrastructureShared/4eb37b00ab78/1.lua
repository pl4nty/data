-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4eb37b00ab78\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1, l_0_2, l_0_3 = nil
    l_0_1 = bm
    l_0_1 = l_0_1.trigger_sig
    l_0_2 = "BM_NewlyRegisteredService"
    l_0_3 = l_0_0
    l_0_1(l_0_2, l_0_3)
  end
  -- DECOMPILER ERROR at PC18: Confused about usage of register: R0 in 'UnsetPending'

  -- DECOMPILER ERROR at PC22: Confused about usage of register: R0 in 'UnsetPending'

  if l_0_0 ~= nil then
    local l_0_4 = nil
    for l_0_8,l_0_9 in ipairs((mp.GetExecutablesFromCommandLine)(l_0_0)) do
      local l_0_5 = nil
      -- DECOMPILER ERROR at PC30: Confused about usage of register: R6 in 'UnsetPending'

      R6_PC30 = (mp.ContextualExpandEnvironmentVariables)(R6_PC30)
      if (sysio.IsFileExists)(R6_PC30) == true then
        (bm.add_related_file)(R6_PC30)
      end
    end
  end
  do
    return mp.INFECTED
  end
end

