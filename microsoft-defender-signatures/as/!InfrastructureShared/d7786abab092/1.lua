-- Threat: !InfrastructureShared
-- Name: d7786abab092
-- Type: 21

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0, r0_1 = false, false
r0_0 = hstrlog[1].hitcount >= 1 or hstrlog[2].hitcount >= 1 or hstrlog[3].hitcount >= 1 or r0_0
r0_1 = hstrlog[4].hitcount >= 1 or hstrlog[5].hitcount >= 1 or hstrlog[6].hitcount >= 1 or r0_1
r0_1 = hstrlog[7].hitcount >= 1 or hstrlog[8].hitcount >= 1 or hstrlog[9].hitcount >= 1 or r0_1
r0_1 = hstrlog[10].hitcount >= 1 or hstrlog[11].hitcount >= 1 or hstrlog[12].hitcount >= 1 or r0_1
if r0_0 and r0_1 then
  return mp.INFECTED
end
return mp.CLEAN
