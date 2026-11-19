-- Threat: !InfrastructureShared
-- Name: 106d773179517
-- Type: 21
-- Flags: 1

local l_0_0 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Features")
if l_0_0 then
  local l_0_1 = sysio.GetRegValueAsDword(l_0_0, "TamperProtection")
  if l_0_1 and mp.bitand(l_0_1, 1) == 1 then
    return mp.SUSPICIOUS
  end
end
return mp.CLEAN
