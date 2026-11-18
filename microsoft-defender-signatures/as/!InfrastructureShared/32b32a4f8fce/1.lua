-- Threat: !InfrastructureShared
-- Name: 32b32a4f8fce
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if not contains(l_0_0, MpCommon.ExpandEnvironmentVariables("%systemdrive%")) then
  return mp.CLEAN
end
local l_0_1 = {
  ":\\programData\\rclone.exe",
  ":\\programData\\usoshared\\",
  ":\\perflogs\\",
  ":\\windows\\help\\",
  ":\\windows\\debug\\",
  ":\\windows\\tapi\\",
  ":\\windows\\temp\\",
  ":\\wmpub\\",
  ":\\intel\\",
  "\\music\\",
  "\\documents\\rclone.exe"
}
if contains(l_0_0, l_0_1) then
  reportSessionInformationInclusive()
  add_parents()
  reportTimingData()
  local l_0_2, l_0_3 = pcall(reportBmInfo)
  if not l_0_2 and l_0_3 then
    bm.add_related_string("bmInfoFailReason", tostring(l_0_3), bm.RelatedStringBMReport)
  end
  return mp.INFECTED
end
return mp.CLEAN
