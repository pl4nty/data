-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\874f_307.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.hstr_full_log)()
if not l_0_0 then
  return mp.INFECTED
end
if (l_0_0[2]).matched or (l_0_0[3]).matched then
  (mp.TriggerScanResource)("folder", "c:\\tempcaches\\", 0, 5000)
end
return mp.INFECTED

