-- Threat: !InfrastructureShared
-- Name: 5541f85c91f3
-- Type: 21

if this_sigattrlog[4].matched then
  local l_0_0 = tonumber(this_sigattrlog[4].p1, 16)
  if not pe.contains_va(2, l_0_0) and not pe.contains_va(3, l_0_0) then
    return mp.CLEAN
  end
  if mp.bitand(l_0_0, 4095) == 0 then
    mp.set_mpattribute("LOWFI:SIGATTR:VirTool:Win32/OwnProcessWriteProcMemVA000")
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
