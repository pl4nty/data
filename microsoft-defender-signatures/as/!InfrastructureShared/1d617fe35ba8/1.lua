-- Threat: !InfrastructureShared
-- Name: 1d617fe35ba8
-- Type: 21

if peattributes.isexe == true and peattributes.no_boundimport == true and peattributes.no_debug == true and peattributes.no_delayimport == true and peattributes.no_loadconfig == true then
  return mp.INFECTED
end
return mp.CLEAN
