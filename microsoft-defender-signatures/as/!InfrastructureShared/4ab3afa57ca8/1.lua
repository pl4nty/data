-- Threat: !InfrastructureShared
-- Name: 4ab3afa57ca8
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
local l_0_1 = {
  "winscp-",
  "winscp_",
  "shimgen.exe"
}
if contains(l_0_0, l_0_1) then
  return mp.CLEAN
end
if not contains(l_0_0, MpCommon.ExpandEnvironmentVariables("%systemdrive%")) then
  return mp.CLEAN
end
local l_0_2 = {
  ":\\programData\\",
  ":\\perflogs\\",
  ":\\windows\\help\\",
  ":\\windows\\debug\\",
  ":\\windows\\tapi\\",
  ":\\windows\\temp\\",
  ":\\wmpub\\",
  ":\\intel\\",
  "\\music\\"
}
if contains(l_0_0, l_0_2) then
  reportSessionInformation()
  return mp.INFECTED
end
return mp.CLEAN
