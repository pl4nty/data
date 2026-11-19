-- Threat: !InfrastructureShared
-- Name: 32b3d0170bdc
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if not contains(l_0_0, MpCommon.ExpandEnvironmentVariables("%systemdrive%")) then
  return mp.CLEAN
end
local l_0_1 = {
  ":\\programData\\",
  ":\\perflogs\\",
  ":\\windows\\help\\",
  ":\\windows\\debug\\",
  ":\\windows\\tapi\\",
  ":\\wmpub\\"
}
if contains(l_0_0, l_0_1) then
  reportSessionInformation()
  return mp.INFECTED
end
return mp.CLEAN
