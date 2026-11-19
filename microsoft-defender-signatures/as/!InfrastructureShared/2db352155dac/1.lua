-- Threat: !InfrastructureShared
-- Name: 2db352155dac
-- Type: 21
-- Includes: RmmImageAgeTelemetryInfra

if Infrastructure_ReportRmmImageAgeActivity("FileCreate", 2, this_sigattrlog[2]) == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN
