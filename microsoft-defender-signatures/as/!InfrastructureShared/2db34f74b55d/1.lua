-- Threat: !InfrastructureShared
-- Name: 2db34f74b55d
-- Type: 21
-- Includes: RmmImageAgeTelemetryInfra

if Infrastructure_ReportRmmImageAgeActivity("ProcessLaunch", 1, this_sigattrlog[2]) == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN
