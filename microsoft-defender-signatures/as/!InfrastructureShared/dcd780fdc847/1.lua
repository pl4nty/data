-- Threat: !InfrastructureShared
-- Name: dcd780fdc847
-- Type: 21

local l_0_0 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Features")
if l_0_0 then
  local l_0_1 = sysio.GetRegValueAsDword(l_0_0, "TamperProtection")
  if l_0_1 and mp.bitand(l_0_1, 1) == 1 then
    return mp.INFECTED
  end
end
return mp.CLEAN
