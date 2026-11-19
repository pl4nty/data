-- Threat: !InfrastructureShared
-- Name: 1ad78d2cac8ba
-- Type: 21

if mp.get_mpattribute("LUA:VeriatoCertClean") or mp.get_mpattribute("Exception:MonitoringTool:Uninstaller:Veriato") or mp.get_mpattribute("CERT:Clean:Veriato") then
  return mp.CLEAN
end
return mp.INFECTED
