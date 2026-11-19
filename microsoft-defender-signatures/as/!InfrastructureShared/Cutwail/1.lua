-- Threat: !InfrastructureShared
-- Name: Cutwail
-- Type: 14

if string.match(Remediation.Threat.Name, "Cutwail") then
  sysio.DeleteService("runtime")
  sysio.DeleteService("runtime2")
  sysio.DeleteService("smtpdrv")
  sysio.StopService("Ip6Fw")
  sysio.StopService("Secdrv")
  sysio.StopService("NetDetect")
end
