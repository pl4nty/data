-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\617873befa0c\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "C:\\Windows\\en-US\\ielowutil.exe.mui"
if (sysio.IsFileExists)(l_0_0) then
  (mp.ReportLowfi)(l_0_0, 1204405327)
end
return mp.INFECTED

