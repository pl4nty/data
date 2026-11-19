-- Threat: !InfrastructureShared
-- Name: 43b305e85003
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

pcallEx("maceSendConfig", maceSendConfig, "mace_qakbot")
pcallEx("reportRelatedBmHits", reportRelatedBmHits)

local function l_0_0()
  local l_1_0, l_1_1 = pcall(bm.get_current_process_startup_info)
  if not l_1_0 then
    return mp.INFECTED
  end
  local l_1_2 = "SuspDllExplorerInject.A_CmdLineDll"
  if MpCommon.GetPersistContextCountNoPath(l_1_2) > 0 then
    local l_1_3 = MpCommon.GetPersistContextNoPath(l_1_2)
    for l_1_4, l_1_5 in ipairs(l_1_3) do
      local l_1_6, l_1_7 = string.match(l_1_5, "([%w%p]+);([%w%p]+)")
      l_1_7 = string.lower(l_1_7)
      if l_1_6 == l_1_1.ppid and string.find(l_1_7, "\\appdata\\", 1, true) then
        bm.add_threat_file(l_1_7)
        break
      end
    end
  end
end

pcallEx("remediateDll", l_0_0)
reportPcallEx()
local l_0_1, l_0_2 = pcall(reportBmInfo)
if not l_0_1 and l_0_2 then
  bm.add_related_string("bmInfoFailReason", tostring(l_0_2), bm.RelatedStringBMReport)
end
return mp.INFECTED
