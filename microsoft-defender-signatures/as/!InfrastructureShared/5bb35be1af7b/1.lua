-- Threat: !InfrastructureShared
-- Name: 5bb35be1af7b
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if not contains(l_0_0, MpCommon.ExpandEnvironmentVariables("%systemdrive%")) then
  return mp.CLEAN
end
local l_0_1 = {
  ":\\programData\\winscp.exe",
  ":\\perflogs\\",
  ":\\windows\\help\\",
  ":\\windows\\debug\\",
  ":\\windows\\tapi\\",
  ":\\wmpub\\",
  ":\\intel\\",
  "\\music\\",
  ":\\users\\public\\"
}
if contains(l_0_0, l_0_1) then
  reportSessionInformation()
  return mp.INFECTED
end
return mp.CLEAN
