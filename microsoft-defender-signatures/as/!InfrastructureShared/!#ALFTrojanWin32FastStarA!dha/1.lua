-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/FastStar.A!dha
-- Type: 13
-- MpAttributes: Implicit:FileExtEQ.fmg

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
if l_0_0 ~= nil and string.sub(l_0_0, -11):lower() == "patched.fmg" then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH))
  if l_0_1 ~= nil and sysio.IsFileExists(l_0_1) then
    mp.ReportLowfi(l_0_1, 1450765366)
  end
  return mp.INFECTED
end
return mp.CLEAN
