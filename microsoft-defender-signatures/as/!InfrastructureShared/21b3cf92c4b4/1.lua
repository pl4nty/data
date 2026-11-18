-- Threat: !InfrastructureShared
-- Name: 21b3cf92c4b4
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[1].matched then
  local l_0_0 = parseLogonEvent(this_sigattrlog[1])
  processPasswordChangeEvent(l_0_0)
end
return mp.CLEAN
