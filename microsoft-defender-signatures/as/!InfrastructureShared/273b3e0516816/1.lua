-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\273b3e0516816\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
  if (bm.GetSignatureMatchDuration)() > 30000000 then
    return mp.CLEAN
  end
  local l_0_0 = ((this_sigattrlog[1]).utf8p2):lower()
  if #l_0_0 < 62 then
    return mp.CLEAN
  end
  if (string.find)(l_0_0, "\\\\tsclient\\", 1, true) or (string.find)(l_0_0, "d:\\", 1, true) or (string.find)(l_0_0, "runpscommand", 1, true) then
    return mp.CLEAN
  end
  l_0_0 = (string.gsub)(l_0_0, "\\1$", "")
  local l_0_1 = l_0_0
  local l_0_2 = ((mp.ContextualExpandEnvironmentVariables)(l_0_0)):lower()
  for l_0_6 = 1, 5 do
    if l_0_1 == l_0_2 then
      break
    else
      l_0_1 = l_0_2
      l_0_2 = ((mp.ContextualExpandEnvironmentVariables)(l_0_2)):lower()
    end
  end
  do
    l_0_0 = l_0_2
    local l_0_7 = #l_0_0 / 2
    local l_0_8 = (string.sub)(l_0_0, -l_0_7)
    local l_0_9, l_0_10 = (bm.get_process_relationships)()
    for l_0_14,l_0_15 in ipairs(l_0_10) do
      local l_0_16 = (mp.bitand)(l_0_15.reason_ex, bm.RELATIONSHIP_CREATED)
      if l_0_16 == bm.RELATIONSHIP_CREATED then
        local l_0_17 = (string.lower)(l_0_15.cmd_line)
        local l_0_18 = (string.sub)(l_0_17, -l_0_7)
        if l_0_8 == l_0_18 then
          (bm.trigger_sig)("StartedViaRUNMRU.gen", "StartedViaRUNMRU.gen", l_0_15.ppid)
          ;
          (bm.trigger_sig_target_propagate)("ProcessChainViaRUNMRU", "ProcessChainViaRUNMRU", l_0_15.ppid)
          if not (MpCommon.DoesProcessHaveAttribute)(l_0_15.ppid, "StartedViaRUNMRU") then
            (MpCommon.AddProcessAttribute)(l_0_15.ppid, "StartedViaRUNMRU", tostring(l_0_17), true)
          end
          AppendToRollingQueue("IsProcessChainViaRUNMRU", l_0_15.ppid, 1, 30)
        end
      end
    end
    do
      l_0_0 = mp
      l_0_0 = l_0_0.CLEAN
      return l_0_0
    end
  end
end

