-- Threat: !InfrastructureShared
-- Name: 82b3d6494cea
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if l_0_3.image_path ~= nil and l_0_3.ppid ~= nil and not MpCommon.IsFriendlyProcess(l_0_3.ppid) then
    local l_0_4 = 1
    local l_0_5 = mp.bitand(l_0_3.reason_ex, l_0_4)
    if l_0_5 == l_0_4 then
      local l_0_6 = l_0_3.image_path
      local l_0_7 = l_0_3.ppid
      local l_0_8 = l_0_3.cmd_line or ""
      local l_0_9 = MpCommon.Base64Encode(l_0_6 .. "|" .. l_0_8) .. ";" .. l_0_7
      local l_0_10 = "RemoteInvocation:WMI|" .. MpCommon.Base64Encode(l_0_6)
      local l_0_11 = reportSessionInformationInclusive()
      AppendToRollingQueue(l_0_10, l_0_7, safeJsonSerialize(l_0_11), 3600, 100, 1)
      recursiveTriggerSig("RemoteInvocation:WMI", l_0_9, l_0_7, 0)
    end
  end
end
reportRelevantUntrustedEntities()
reportTimingData()
return mp.CLEAN
