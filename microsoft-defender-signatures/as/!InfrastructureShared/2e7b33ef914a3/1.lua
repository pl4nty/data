-- Threat: !InfrastructureShared
-- Name: 2e7b33ef914a3
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p2:lower()
  if #l_0_0 < 10 then
    return mp.CLEAN
  end
  local l_0_1 = mp.ContextualExpandEnvironmentVariables(l_0_0):lower():gsub("%s+$", "")
  l_0_0 = l_0_1
  local l_0_2 = string.match(l_0_0, "([%w%-_]+%.exe)")
  if not l_0_2 then
    return mp.CLEAN
  end
  local l_0_3, l_0_4 = bm.get_process_relationships()
  for l_0_5, l_0_6 in ipairs(l_0_4) do
    local l_0_7 = mp.bitand(l_0_6.reason_ex, bm.RELATIONSHIP_CREATED)
    if l_0_7 == bm.RELATIONSHIP_CREATED then
      local l_0_8 = string.lower(l_0_6.cmd_line)
      local l_0_9 = string.match(l_0_8, "([%w%-_]+%.exe)")
      if l_0_9 and l_0_9 == l_0_2 then
        bm.trigger_sig("StartedViatypedpaths.gen", "StartedViatypedpaths.gen", l_0_6.ppid)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
