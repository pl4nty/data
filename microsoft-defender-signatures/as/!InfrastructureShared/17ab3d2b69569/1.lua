-- Threat: !InfrastructureShared
-- Name: 17ab3d2b69569
-- Type: 21

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  local l_0_0
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
  if not string.find(l_0_0, "wget", 1, true) and not string.find(l_0_0, "curl", 1, true) and not string.find(l_0_0, "invoke-webrequest", 1, true) then
    return mp.CLEAN
  end
end
bm.trigger_sig_self_propagate("SuspMMCExec.C", "INFECTED")
return mp.INFECTED
