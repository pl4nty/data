-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a33c_507.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).wp1 ~= nil then
    local l_0_0, l_0_1, l_0_2 = nil
  else
  end
  -- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

  do
    if not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).wp1 == nil or (this_sigattrlog[2]).utf8p1 ~= nil then
      local l_0_3, l_0_4 = (mp.ContextualExpandEnvironmentVariables)((this_sigattrlog[2]).utf8p1)
      l_0_4 = bm
      l_0_4 = l_0_4.add_related_file
      l_0_4(l_0_3)
    end
    ;
    (bm.trigger_sig_self_propagate)("SuspChildProcessLaunch", "Behavior:Win32/CarbonCoffee.A!dha")
    return mp.INFECTED
  end
end

