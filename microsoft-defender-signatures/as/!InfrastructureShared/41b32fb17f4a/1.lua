-- Threat: !InfrastructureShared
-- Name: 41b32fb17f4a
-- Type: 21

if this_sigattrlog[2].matched then
  local l_0_0 = this_sigattrlog[2].ppid
  if this_sigattrlog[1].matched and this_sigattrlog[1].ppid then
    local l_0_1 = this_sigattrlog[1].utf8p1
    local l_0_2 = this_sigattrlog[1].utf8p2
    local l_0_3 = l_0_2 .. ";" .. l_0_0
    bm.trigger_sig(l_0_1, l_0_3, l_0_0)
  end
end
return mp.CLEAN
