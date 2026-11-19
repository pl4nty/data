-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:LNK/SuspProcinISO.SD
-- Type: 13
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: (Lua:OpenLnkCrossVolume_CdToSys | Lua:OpenLnkCrossVolume_CdToSysRel)

local l_0_0 = mp.GetLnkInfo()
local l_0_1 = l_0_0.Arguments
local l_0_2 = l_0_0.BasePath
local l_0_3 = {
  "odbcconf",
  "rundll32",
  "regsvr",
  "powershell",
  "calc",
  "wscript",
  "cscript",
  "mshta"
}
if l_0_1 ~= nil and contains(l_0_1:lower(), l_0_3) or l_0_2 ~= nil and contains(l_0_2:lower(), l_0_3) then
  local l_0_4, l_0_5 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_4 == nil or 2 < #l_0_4 or l_0_5 == nil then
    return mp.CLEAN
  end
  local l_0_6 = l_0_4 .. "\\" .. l_0_5
  local l_0_7 = MpCommon.GetMountedFileBackingFilePath(l_0_6)
  if l_0_7 == nil then
    return mp.CLEAN
  end
  if IsKeyInRollingQueue("CC_filelist", l_0_7) then
    mp.ReportLowfi(l_0_7, 818474255)
  end
  return mp.INFECTED
end
return mp.CLEAN
