-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00001557_luac 

-- params : ...
-- function num : 0
local l_0_0 = (MpCommon.ExpandEnvironmentVariables)("%ProgramData%")
if not (sysio.IsFolderExists)(l_0_0) then
  return mp.CLEAN
end
;
(mp.TriggerScanResource)("folder", l_0_0)
return mp.INFECTED

