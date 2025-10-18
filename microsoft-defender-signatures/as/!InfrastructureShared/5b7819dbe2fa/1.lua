-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5b7819dbe2fa\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "C:\\Windows\\Media\\Alarm00.wav"
if (sysio.IsFileExists)(l_0_0) then
  (mp.ReportLowfi)(l_0_0, 3364434415)
end
return mp.INFECTED

