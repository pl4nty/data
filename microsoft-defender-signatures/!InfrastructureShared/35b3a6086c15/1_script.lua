-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\35b3a6086c15\1_luac 

-- params : ...
-- function num : 0
if (bm.GetSignatureMatchDuration)() > 50000000 then
  return mp.CLEAN
end
local l_0_0 = (bm.get_current_process_startup_info)()
AppendToRollingQueue("iscsicpl_bypass", l_0_0.ppid, 1, 5)
return mp.INFECTED

