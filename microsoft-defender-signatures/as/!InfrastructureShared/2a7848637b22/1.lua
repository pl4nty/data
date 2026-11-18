-- Threat: !InfrastructureShared
-- Name: 2a7848637b22
-- Type: 21

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

if peattributes.isexe == true and (mp.get_mpattribute("NID:Trojan:Win32/Fragtor.AD!MTB") or true) then
  return mp.INFECTED
end
return mp.CLEAN
