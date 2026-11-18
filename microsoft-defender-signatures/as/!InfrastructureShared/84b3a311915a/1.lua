-- Threat: !InfrastructureShared
-- Name: 84b3a311915a
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = MpCommon.PathToWin32Path(bm.get_imagepath())
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if not contains(l_0_0, MpCommon.ExpandEnvironmentVariables("%systemdrive%")) then
  return mp.CLEAN
end
local l_0_1 = {
  ":\\windows\\",
  ":\\users\\public\\",
  ":\\recovery\\",
  "c:\\temp\\",
  "\\downloads\\",
  ":\\ProgramData\\backup\\"
}
if not contains(l_0_0, l_0_1) then
  return mp.CLEAN
end
local l_0_2 = bm.get_current_process_startup_info()
if l_0_2 ~= nil and l_0_2.command_line ~= nil then
  local l_0_3 = {
    "mega",
    "webdav",
    "copy",
    "ftp"
  }
  if contains(l_0_2.command_line, l_0_3) then
    bm.add_related_file(l_0_0)
    reportSessionInformation()
    return mp.INFECTED
  end
end
return mp.CLEAN
