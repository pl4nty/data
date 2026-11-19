-- Threat: !InfrastructureShared
-- Name: a578112452e0
-- Type: 21

if peattributes.isexe == true and peattributes.no_boundimport == true and peattributes.no_debug == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
