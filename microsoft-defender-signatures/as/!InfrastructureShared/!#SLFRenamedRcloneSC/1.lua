-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFRenamedRcloneSC\1.luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("Lua:PeOriginalName!rclone.exe") then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("Lua:PeInternalName!rclone") then
  return mp.CLEAN
end
local l_0_0 = (MpCommon.PathToWin32Path)((mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)))
if l_0_0 == nil then
  return mp.CLEAN
end
;
(MpCommon.SetOriginalFileName)(l_0_0, "rclone.exe")
return mp.INFECTED

