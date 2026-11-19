-- Threat: !InfrastructureShared
-- Name: 2bfb32cb47354
-- Type: 21
-- Includes: LuaFuncHelper

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  if bm.GetSignatureMatchDuration() > 80000000 then
    return mp.CLEAN
  end
  local l_0_0 = this_sigattrlog[1].utf8p2:lower()
  if #l_0_0 < 32 then
    return mp.CLEAN
  end
  l_0_0 = string.gsub(l_0_0, "\\1$", "")
  if string.find(l_0_0, "\\\\tsclient\\", 1, true) or string.find(l_0_0, "d:\\", 1, true) or string.find(l_0_0, "claude.ai/install", 1, true) or string.find(l_0_0, "openclaw.ai/install", 1, true) or string.find(l_0_0, "runpscommand", 1, true) or string.find(l_0_0, "python/core/", 1, true) then
    return mp.CLEAN
  end
  local l_0_1 = l_0_0:lower()
  local l_0_2 = mp.ContextualExpandEnvironmentVariables(l_0_0):lower()
  for l_0_3 = 1, 5 do
    if l_0_1 == l_0_2 then
      break
    else
      l_0_1 = l_0_2
      l_0_2 = mp.ContextualExpandEnvironmentVariables(l_0_2):lower()
    end
  end
  local l_0_4 = l_0_2
  local l_0_5 = #l_0_4 / 2
  local l_0_6 = string.sub(l_0_4, -l_0_5)
  local l_0_7 = l_0_4:gsub("\"", "")
  l_0_7 = l_0_4:gsub("%%windir%%", "c:\\windows")
  l_0_7 = l_0_7:gsub("%%comspec%%", "c:\\windows\\system32\\cmd.exe")
  local l_0_8, l_0_9 = bm.get_process_relationships()
  for l_0_10, l_0_11 in ipairs(l_0_9) do
    local l_0_12 = mp.bitand(l_0_11.reason_ex, bm.RELATIONSHIP_CREATED)
    if l_0_12 == bm.RELATIONSHIP_CREATED then
      local l_0_13 = string.lower(l_0_11.cmd_line)
      local l_0_14 = string.sub(l_0_13, -l_0_5)
      local l_0_15 = l_0_14:gsub("\"", "")
      if l_0_6 == l_0_14 or l_0_4:find(l_0_14, 1, true) or l_0_7:find(l_0_15, 1, true) then
        bm.trigger_sig("StartedViaRUNMRU.gen", "StartedViaRUNMRU.gen", l_0_11.ppid)
        bm.trigger_sig_target_propagate("ProcessChainViaRUNMRU", "ProcessChainViaRUNMRU", l_0_11.ppid)
        if not MpCommon.DoesProcessHaveAttribute(l_0_11.ppid, "StartedViaRUNMRU") then
          MpCommon.AddProcessAttribute(l_0_11.ppid, "StartedViaRUNMRU", tostring(l_0_13), true)
        end
        AppendToRollingQueue("IsProcessChainViaRUNMRU", l_0_11.ppid, 1, 30)
        local l_0_16, l_0_17, l_0_18 = IsKeyInRollingQueue("IsFromWebClipWrite", l_0_0, true)
        if l_0_16 and next(l_0_18) ~= nil then
          bm.trigger_sig("FromWebClipWrite", safeJsonSerialize(l_0_18), l_0_11.ppid)
          bm.trigger_sig_target_propagate("ProcessChainFromWebClipWrite", "ProcessChainFromWebClipWrite", l_0_11.ppid)
          AppendToRollingQueue("IsProcessChainFromWebClipWrite", l_0_11.ppid, 1, 30)
        end
      end
    end
  end
end
return mp.CLEAN
