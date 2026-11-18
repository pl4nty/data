-- Threat: !InfrastructureShared
-- Name: 2a619aa02afd
-- Type: 21

if peattributes.isdll == true and peattributes.no_resources == true and peattributes.no_debug == true and peattributes.no_delayimport == true and peattributes.no_loadconfig == true then
  return mp.INFECTED
end
return mp.CLEAN
