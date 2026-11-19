-- Threat: !InfrastructureShared
-- Name: 2db33ecc726c
-- Type: 21
-- Includes: RmmImageAgeTelemetryInfra

if Infrastructure_ReportRmmImageAgeActivity("ProcessLaunch", 15, this_sigattrlog[2]) == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN
