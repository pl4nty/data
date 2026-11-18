-- Threat: !InfrastructureShared
-- Name: 19b3e67f70aa
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p1
  local l_0_1 = false
  local l_0_2 = {
    "ALF:",
    "SLF:",
    "TEL:",
    "ALFPER:",
    "SLFPER:",
    "TELPER:"
  }
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    if string.sub(l_0_0, 1, string.len(l_0_4)) == l_0_4 then
      l_0_1 = true
      break
    end
  end
  if not l_0_1 then
    return mp.CLEAN
  end
  bm.trigger_sig("DHA_LOWFI_AMSI_MATCH", l_0_0)
  bm.trigger_sig_self_propagate("SuspChildProcessLaunch", l_0_0)
  bm.add_related_string("vname", l_0_0, bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
