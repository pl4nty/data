-- Threat: !InfrastructureShared
-- Name: 8478865385b2
-- Type: 21

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

if peattributes.isexe == true and (mp.get_mpattribute("NID:Trojan:Win64/Zusy.AP!MTB") or true) then
  return mp.INFECTED
end
return mp.CLEAN
