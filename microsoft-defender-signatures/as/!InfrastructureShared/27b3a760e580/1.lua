-- Threat: !InfrastructureShared
-- Name: 27b3a760e580
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p1 ~= nil and this_sigattrlog[1].utf8p1 ~= "" and string.match(this_sigattrlog[1].utf8p1, "/%.[^/]+$") then
  bm.trigger_sig("HiddenParent", this_sigattrlog[1].utf8p1)
  local l_0_0, l_0_1 = bm.get_process_relationships()
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    bm.trigger_sig("HiddenParent", this_sigattrlog[1].utf8p1, l_0_3.ppid)
  end
  return mp.INFECTED
end
return mp.CLEAN
