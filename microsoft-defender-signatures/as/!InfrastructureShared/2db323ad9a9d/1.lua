-- Threat: !InfrastructureShared
-- Name: 2db323ad9a9d
-- Type: 21
-- Includes: RmmImageAgeTelemetryInfra

if Infrastructure_ReportRmmImageAgeActivity("FileCreate", 16, this_sigattrlog[2]) == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN
