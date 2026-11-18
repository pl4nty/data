-- Threat: !InfrastructureShared
-- Name: 84b31339e45e
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if not contains(l_0_0, MpCommon.ExpandEnvironmentVariables("%systemdrive%")) then
  return mp.CLEAN
end
local l_0_1 = {
  ":\\programData\\",
  ":\\perflogs\\",
  ":\\wmpub\\",
  ":\\intel\\",
  "\\music\\",
  "\\documents\\",
  ":\\windows\\",
  ":\\users\\public\\",
  ":\\recovery\\",
  "c:\\temp\\"
}
if contains(l_0_0, l_0_1) then
  reportSessionInformationInclusive()
  add_parents()
  reportTimingData()
  return mp.INFECTED
end
return mp.CLEAN
