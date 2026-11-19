-- Threat: !InfrastructureShared
-- Name: af7831c72ef4
-- Type: 21

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0, r0_1, r0_2 = false, false, false
r0_0 = hstrlog[1].hitcount >= 1 or hstrlog[2].hitcount >= 1 or hstrlog[3].hitcount >= 1 or r0_0
r0_1 = hstrlog[4].hitcount >= 1 or hstrlog[5].hitcount >= 1 or r0_1
r0_2 = mp.get_mpattribute("MpHasExpensiveLoop") and true or r0_2
r0_2 = peattributes.dt_error_heur_exit_criteria and true or r0_2
local r0_3 = mp
r0_3 = r0_3.get_mpattribute
r0_3 = r0_3("MpHasValidProjPath")
if r0_0 and r0_1 and (r0_3 and true or r0_2) then
  return mp.INFECTED
end
return mp.CLEAN
