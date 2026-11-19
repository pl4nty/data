-- Threat: !InfrastructureShared
-- Name: 1d6137928b8d
-- Type: 21

if peattributes.isdll == true and peattributes.no_resources == true and peattributes.no_debug == true and peattributes.no_delayimport == true and peattributes.no_loadconfig == true then
  return mp.INFECTED
end
return mp.CLEAN
