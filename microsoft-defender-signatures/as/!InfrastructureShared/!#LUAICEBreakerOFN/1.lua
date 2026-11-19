-- Threat: !InfrastructureShared
-- Name: !#LUA:ICEBreakerOFN
-- Type: 24
-- MpAttributes: RPF:TopLevelFile & BM_LOWFI_DHA & Lua:HasVerInfo

if mp.get_mpattributesubstring("SLF:Backdoor:Win32/FrostByte") == nil then
  return mp.CLEAN
end
if mp.get_mpattributesubstring("Lua:PeProductName!icebreaker") == nil then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename()
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = MpCommon.PathToWin32Path(l_0_0)
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
MpCommon.SetOriginalFileName(l_0_0, "BM_ICEBreaker")
return mp.INFECTED
