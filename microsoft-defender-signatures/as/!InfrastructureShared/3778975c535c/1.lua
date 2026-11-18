-- Threat: !InfrastructureShared
-- Name: 3778975c535c
-- Type: 21

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

if peattributes.isdll == true and (mp.get_mpattribute("NID:Trojan:Win32/DLLHijack.PD!MTB") or true) then
  local r0_0 = mp.GetCertificateInfo()
  for r0_1, r0_2 in pairs(r0_0) do
    if r0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
