-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win32/SusEnumDesktopsA.MK
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: RPF:TopLevelFile & BM_MZ_FILE

local l_0_0 = GetRollingQueueKeys("Trojan:Win32/EnumDesktopsA.AM")
if l_0_0 then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
  if l_0_1 ~= nil then
    local l_0_2, l_0_3 = string.match(l_0_1, "^pid:(%w+),ProcessStart:(%w+)$")
    local l_0_4 = tonumber(l_0_2)
    local l_0_5 = tonumber(l_0_3)
    local l_0_6, l_0_7 = mp.bsplit(l_0_5, 32)
    local l_0_8 = string.format("ppids:{{%d,%d,%d}}\000", l_0_4, l_0_6, l_0_7)
    mp.TriggerScanResource("ems", l_0_8, mp.SCANSOURCE_RTSIG, 3000)
    return mp.INFECTED
  end
end
return mp.CLEAN
