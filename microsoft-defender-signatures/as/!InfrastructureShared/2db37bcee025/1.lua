-- Threat: !InfrastructureShared
-- Name: 2db37bcee025
-- Type: 21

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  local l_0_0 = this_sigattrlog[2].utf8p1
  local l_0_1, l_0_2 = string.match(l_0_0, "targetprocessppid:(%d+):(%d+)")
  if not l_0_1 or not l_0_2 then
    return mp.CLEAN
  end
  local l_0_3 = string.format("pid:%s,ProcessStart:%s", l_0_1, l_0_2)
  bm.trigger_sig("BMSuspAddTypeExports.A", "Behavior:Win32/SuspAddTypeExports.A", l_0_3)
end
return mp.CLEAN
