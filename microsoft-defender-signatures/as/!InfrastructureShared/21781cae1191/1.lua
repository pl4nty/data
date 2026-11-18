-- Threat: !InfrastructureShared
-- Name: 21781cae1191
-- Type: 21

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

if peattributes.isexe == true and (mp.get_mpattribute("NID:Trojan:Win32/Ekstak.GM!MTB") or true) then
  local r0_0 = mp.GetCertificateInfo()
  for r0_1, r0_2 in pairs(r0_0) do
    if r0_2.Signers ~= nil then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
