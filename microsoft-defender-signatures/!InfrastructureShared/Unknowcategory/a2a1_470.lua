-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a2a1_470.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0, l_0_1 = nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  do
    if l_0_0 ~= nil then
      local l_0_2 = nil
      if l_0_2:match("%d%d%d%d%d%d%d%d%d%d%d%d%d%d%d%d%d%d%d|%d+%.%d+%.%d+%.%d+|%d+%.%d+%.%d+%.%d+") then
        (bm.trigger_sig_self_propagate)("SuspChildProcessLaunch", "Behavior:Win32/KoalaTwin.A!dha")
        return mp.INFECTED
      end
    end
    return mp.CLEAN
  end
end

