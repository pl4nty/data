-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTamperingWin32AppLockerMDEB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = tostring(headerpage) .. tostring(footerpage)
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
do
  local l_0_1 = (string.match)(l_0_0, "set%-applockerpolicy%s+%-xmlpolicy%s+(.-%.xml)") or ""
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R1 in 'UnsetPending'

  local l_0_2 = l_0_1:gsub("\'", "")
  l_0_2 = l_0_2:gsub("\"", "")
  l_0_2 = l_0_2:gsub("^%.\\", "")
  local l_0_3 = l_0_2:gsub("([%^%$%(%)%.%[%]%*%+%-%?])", "\\%1")
  local l_0_4, l_0_5 = pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentAppLockerPolicyFileDropped", l_0_3)
  if l_0_4 and l_0_5 then
    set_research_data("PolicyFile", (MpCommon.Base64Encode)(l_0_2 .. "|" .. l_0_5), false)
    local l_0_6 = {}
    l_0_6.policyFile = l_0_2
    l_0_6.Condition = l_0_5
    l_0_6.parents = add_parents_AMSI()
    local l_0_7, l_0_8 = safeJsonSerialize(l_0_6, 150, nil, true)
    do
      do
        if l_0_7 then
          local l_0_9 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
          if l_0_9 then
            (MpCommon.BmTriggerSig)(l_0_9, "LuaAppLockerMDE", safeJsonSerialize(l_0_7))
          end
        end
        do return mp.INFECTED end
        return mp.CLEAN
      end
    end
  end
end

