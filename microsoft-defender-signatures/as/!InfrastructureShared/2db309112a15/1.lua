-- Threat: !InfrastructureShared
-- Name: 2db309112a15
-- Type: 21
-- Includes: RmmImageAgeTelemetryInfra

if Infrastructure_ReportRmmImageAgeActivity("FileCreate", 15, this_sigattrlog[2]) == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN
