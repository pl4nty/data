-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\15408a509957\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "c:\\Windows\\system32\\en-US\\iscsiexes.dll.mui"
if (sysio.IsFileExists)(l_0_0) then
  (mp.ReportLowfi)(l_0_0, 504602719)
end
return mp.INFECTED

