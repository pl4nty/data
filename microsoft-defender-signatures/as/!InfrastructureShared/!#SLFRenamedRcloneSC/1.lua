-- Threat: !InfrastructureShared
-- Name: !#SLF:RenamedRclone.SC
-- Type: 10
-- MpAttributes: Lua:PeOriginalNameDiffFromFileName & HSTR:GolangBinary & Lua:PeInternalNameDiffFromFileName

if not mp.get_mpattribute("Lua:PeOriginalName!rclone.exe") then
  return mp.CLEAN
end
if not mp.get_mpattribute("Lua:PeInternalName!rclone") then
  return mp.CLEAN
end
local l_0_0 = MpCommon.PathToWin32Path(mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)))
if l_0_0 == nil then
  return mp.CLEAN
end
MpCommon.SetOriginalFileName(l_0_0, "rclone.exe")
return mp.INFECTED
