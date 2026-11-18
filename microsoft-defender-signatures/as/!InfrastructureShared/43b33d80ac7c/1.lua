-- Threat: !InfrastructureShared
-- Name: 43b33d80ac7c
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

pcallEx("maceSendConfig", maceSendConfig, "mace_zloader")
pcallEx("reportRelatedBmHits", reportRelatedBmHits)

local function l_0_0()
  local l_1_0 = bm.get_current_process_startup_info()
  local l_1_1 = "DllMsiexecInject.A_CmdLineDll"
  if MpCommon.GetPersistContextCountNoPath(l_1_1) > 0 then
    local l_1_2 = MpCommon.GetPersistContextNoPath(l_1_1)
    for l_1_3, l_1_4 in ipairs(l_1_2) do
      local l_1_5, l_1_6 = string.match(l_1_4, "([%w%p]+);([%w%p]+)")
      l_1_6 = string.lower(l_1_6)
      if l_1_5 == l_1_0.ppid and string.find(l_1_6, "\\appdata\\", 1, true) then
        bm.add_threat_file(l_1_6)
        break
      end
    end
  end
end

pcallEx("remediateDll", l_0_0)
reportPcallEx()
return mp.INFECTED
