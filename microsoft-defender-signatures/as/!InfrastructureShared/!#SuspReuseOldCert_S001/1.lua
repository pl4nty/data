-- Threat: !InfrastructureShared
-- Name: !#SuspReuseOldCert_S001
-- Type: 10
-- MpAttributes: RPF:TopLevelFile & BM_HAS_DIGITALSIGNATURE & OldCert:Win32/AnFu.A

if peattributes.x86_image == false then
  return mp.INFECTED
end
if pehdr.TimeDateStamp ~= 0 then
  local l_0_0 = 1577836800
  if l_0_0 < pehdr.TimeDateStamp then
    return mp.INFECTED
  end
end
return mp.CLEAN
