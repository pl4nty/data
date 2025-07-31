-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2e7b33ef914a3\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
  local l_0_0 = ((this_sigattrlog[1]).utf8p2):lower()
  if #l_0_0 < 10 then
    return mp.CLEAN
  end
  local l_0_1 = (((mp.ContextualExpandEnvironmentVariables)(l_0_0)):lower()):gsub("%s+$", "")
  l_0_0 = l_0_1
  local l_0_2 = (string.match)(l_0_0, "([%w%-_]+%.exe)")
  if not l_0_2 then
    return mp.CLEAN
  end
  local l_0_3, l_0_4 = (bm.get_process_relationships)()
  for l_0_8,l_0_9 in ipairs(l_0_4) do
    local l_0_10 = (mp.bitand)(l_0_9.reason_ex, bm.RELATIONSHIP_CREATED)
    if l_0_10 == bm.RELATIONSHIP_CREATED then
      local l_0_11 = (string.lower)(l_0_9.cmd_line)
      local l_0_12 = (string.match)(l_0_11, "([%w%-_]+%.exe)")
      if l_0_12 and l_0_12 == l_0_2 then
        (bm.trigger_sig)("StartedViatypedpaths.gen", "StartedViatypedpaths.gen", l_0_9.ppid)
        return mp.INFECTED
      end
    end
  end
end
do
  l_0_0 = mp
  l_0_0 = l_0_0.CLEAN
  return l_0_0
end

