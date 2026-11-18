-- Threat: !InfrastructureShared
-- Name: !#ALF:Backdoor:Win32/HopSkipJumpPayload.A
-- Type: 13
-- MpAttributes: ALF:Trojan:Win32/HopSkipJump.A

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" or l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_2
if l_0_1 == "rcdll.dll" then
  l_0_2 = MpCommon.PathToWin32Path(l_0_0 .. "\\" .. "rc")
  if sysio.IsFileExists(l_0_2) then
    mp.ReportLowfi(l_0_2, 3156325347)
  end
end
return mp.CLEAN
