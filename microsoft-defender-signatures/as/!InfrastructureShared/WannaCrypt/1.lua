-- Threat: !InfrastructureShared
-- Name: WannaCrypt
-- Type: 15

sysio.StopService("mssecsvc2.0")
sysio.DeleteService("mssecsvc2.0")
