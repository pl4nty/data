-- Threat: \xac!AppDomainManagerType.C
-- Type: 13
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: SCPT:AppDomainManagerType.A & SCPT:AppDomainManagerType.B & !BM_MZ_FILE & RPF:TopLevelFile

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if isnull(l_0_0) or string.find(l_0_0, "program files", 1, true) or not string.find(l_0_0, "%.exe%.config$") then
  return mp.CLEAN
end
if string.lower(l_0_0) == "c:\\windows\\microsoft.net\\framework\\v4.0.30319\\ngentask.exe.config" and (mp.GetMachineGUID() or "") == "0CA8A424-55F3-D616-23EC-EEF8DB1E3F15" then
  return mp.CLEAN
end
l_0_0 = MpCommon.PathToWin32Path(l_0_0)
local l_0_1 = l_0_0:match("^(.*)[/\\][^/\\]+$")
local l_0_2 = math_min(10000, mp.getfilesize() or 0)
if l_0_2 == 0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_3 = tostring(mp.readfile(0, l_0_2))
mp.readprotection(true)
local l_0_4 = l_0_3:match("<appDomainManagerAssembly value=\"([^\"\r\n\\,]+)")
if isnull(l_0_4) then
  return mp.CLEAN
end
if not string.find(l_0_4, ".exe$") then
  l_0_4 = l_0_4 .. ".exe"
end
local l_0_5 = l_0_3:match("<probing privatePath=\"([^\"\r\n]+)") or l_0_1
local l_0_6 = MpCommon.PathToWin32Path(l_0_5 .. (string.sub(l_0_5, -1) == "\\" and "" or "\\") .. l_0_4)
if not sysio.IsFileExists(l_0_6) then
  l_0_6 = l_0_1 .. "\\" .. l_0_4
  if l_0_5 == l_0_1 or not sysio.IsFileExists(l_0_6) then
    return mp.CLEAN
  end
end
local l_0_7 = "SuspiciousAppDomainAssembly"
mp.ReportLowfi(l_0_6, 1924697406)
mp.set_mpattribute(string.format("%s!%s", l_0_7, l_0_6))
MpCommon.SetOriginalFileName(l_0_6, string.format("BM_%s", l_0_7))
local l_0_8 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if not isnull(l_0_8) then
  MpCommon.BmTriggerSig(l_0_8, l_0_7, string.format("Config=%s;Assembly=%s", l_0_0, l_0_6))
end
return mp.INFECTED
