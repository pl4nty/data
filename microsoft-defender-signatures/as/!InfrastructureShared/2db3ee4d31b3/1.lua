-- Threat: !InfrastructureShared
-- Name: 2db3ee4d31b3
-- Type: 21
-- Includes: RmmImageAgeTelemetryInfra

if Infrastructure_ReportRmmImageAgeActivity("ProcessLaunch", 11, this_sigattrlog[2]) == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN
