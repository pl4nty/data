-- Threat: !InfrastructureShared
-- Name: 2db3b357aafc
-- Type: 21

local l_0_0 = MpCommon.ExpandEnvironmentVariables("%ExchangeInstallPath%")
if l_0_0 == nil or l_0_0 == "" or l_0_0 == "%ExchangeInstallPath%" then
  return mp.CLEAN
end
if not sysio.IsFileExists(l_0_0 .. "bin\\Microsoft.Exchange.Store.Service.exe") then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[2].matched then
  l_0_1 = this_sigattrlog[2].utf8p2
end
if l_0_1 ~= nil then
  bm.trigger_sig(l_0_1, "ProcessBlockExchg")
end
return mp.INFECTED
