-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFBackdoorWin32SuspMailboxExportB\0x000006e2_luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
if l_0_0 and l_0_1 ~= nil and (sysio.IsFileExists)(l_0_1) then
  (mp.ReportLowfi)(l_0_1, 2004662694)
  return mp.INFECTED
end
return mp.CLEAN

