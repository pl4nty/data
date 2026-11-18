-- Threat: !InfrastructureShared
-- Name: 9cb3f89e03d8
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if not contains(l_0_0, MpCommon.ExpandEnvironmentVariables("%systemdrive%")) then
  return mp.CLEAN
end
local l_0_1 = {
  ":\\windows\\",
  ":\\users\\public\\",
  ":\\recovery\\"
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
    bm.add_threat_file(l_0_0)
    reportSessionInformation()
    local l_0_4, l_0_5 = pcall(reportBmInfo)
    if not l_0_4 and l_0_5 then
      bm.add_related_string("bmInfoFailReason", tostring(l_0_5), bm.RelatedStringBMReport)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
