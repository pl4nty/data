-- Threat: !InfrastructureShared
-- Name: 9178005f98c6
-- Type: 21

mp.set_mpattribute("do_exhaustivehstr_rescan")
local r0_0 = hstrlog[1].matched and hstrlog[2].matched
  or hstrlog[1].matched and hstrlog[3].matched
  or hstrlog[2].matched and hstrlog[3].matched
if r0_0 == true then
  return mp.SUSPICIOUS
end
return mp.CLEAN
