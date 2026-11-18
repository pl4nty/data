-- Threat: !InfrastructureShared
-- Name: 5178e5475033
-- Type: 21

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

if mp.get_mpattribute("HSTR:Trojan:Win32/ChineseKeyboardCheck!MTB") then
  return mp.INFECTED
end
return mp.CLEAN
