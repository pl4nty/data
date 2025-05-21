-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\946d_359.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[2]).matched and (this_sigattrlog[3]).matched then
  (bm.trigger_sig_self_propagate)("SuspChildProcessLaunch", "Behavior:Win32/WinterCoat.A!dha")
  return mp.INFECTED
end
return mp.CLEAN

