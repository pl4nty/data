-- Threat: !InfrastructureShared
-- Name: 65b341ec167c
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0, l_0_1 = pcallEx("get_startup_info", bm.get_current_process_startup_info)
local l_0_2 = l_0_0 and l_0_1 ~= nil and l_0_1.ppid ~= nil and l_0_1.ppid or ""

local function l_0_3()
  local l_1_0 = GetRollingQueueKeys("015b9d6d_" .. l_0_2)
  if l_1_0 ~= nil and type(l_1_0) == "table" then
    for l_1_1, l_1_2 in ipairs(l_1_0) do
      bm.add_related_string("mace_015b9d6d", l_1_2, bm.RelatedStringBMReport)
    end
  end
end

local function l_0_4()
  local l_2_0 = GetRollingQueueKeys("82e27b72_" .. l_0_2)
  if l_2_0 ~= nil and type(l_2_0) == "table" then
    for l_2_1, l_2_2 in ipairs(l_2_0) do
      bm.add_related_string("mace_82e27b72", l_2_2, bm.RelatedStringBMReport)
    end
  end
end

local function l_0_5()
  local l_3_0 = string.format("ScanBeaconing.A:%s", l_0_2)
  local l_3_1 = MpCommon.AtomicCounterValue(l_3_0)
  if l_3_1 ~= nil then
    bm.add_related_string("mace_7d0d767b", string.format("%d", l_3_1), bm.RelatedStringBMReport)
  end
end

pcallEx("BlockC2Connection", BlockC2Connection, "cobaltstrike_e")
pcallEx("maceSendConfig", maceSendConfig, "mace_atosev")
pcallEx("reportRelatedBmHits", reportRelatedBmHits)
pcallEx("triggerMemoryScanOnProcessTree", triggerMemoryScanOnProcessTree, false, true, "SMS_H", 5000, "Behavior:Win32/CobaltStrike.D!sms")
pcallEx("addChildrenAsThreat", addChildrenAsThreat)
pcallEx("reportPatch", l_0_4)
pcallEx("reportHosts", l_0_3)
pcallEx("reportBeaconing", l_0_5)
reportPcallEx()
reportRdTrace()
local l_0_6, l_0_7 = pcall(reportBmInfo)
if not l_0_6 and l_0_7 then
  bm.add_related_string("bmInfoFailReason", tostring(l_0_7), bm.RelatedStringBMReport)
end
return mp.INFECTED
