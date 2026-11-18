-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/PyArmor.B
-- Type: 13
-- MpAttributes: //PyInstallerPropagated & SCRT:BRUTE:Pyarmor.S01 & SCRT:BRUTE:Pyarmor.S02

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
local l_0_1 = l_0_0:match("^(.-)%-%>")
if not l_0_1 then
  return mp.CLEAN
end
MpCommon.SetOriginalFileName(l_0_1, "PyArmor")
return mp.CLEAN
