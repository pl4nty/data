-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\95b37830e2d6\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).wp1 ~= nil then
    local l_0_0, l_0_1 = nil
    l_0_1 = bm
    l_0_1 = l_0_1.add_related_file
    l_0_1(l_0_0)
  end
  ;
  (bm.trigger_sig_self_propagate)("SuspChildProcessLaunch", "Behavior:Win32/SingingSilver.A!dha")
  return mp.INFECTED
end

