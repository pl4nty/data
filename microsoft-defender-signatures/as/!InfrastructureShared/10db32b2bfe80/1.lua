-- Threat: !InfrastructureShared
-- Name: 10db32b2bfe80
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = "c:\\inetpub\\wwwroot\\aspnet_client\\system_web\\iisstart.aspx"
elseif this_sigattrlog[2].matched then
  local l_0_1 = MpCommon.ExpandEnvironmentVariables("%ExchangeInstallPath%")
  if l_0_1 == nil or l_0_1 == "" or l_0_1 == "%ExchangeInstallPath%" then
    return mp.CLEAN
  end
  l_0_0 = l_0_1 .. "FrontEnd\\HttpProxy\\ecp\\auth\\Logout.aspx"
end
if sysio.IsFileExists(l_0_0) then
  bm.add_related_file(l_0_0)
  mp.TriggerScanResource("file", l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
