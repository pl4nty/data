-- Threat: !InfrastructureShared
-- Name: 8278cd208204
-- Type: 21

local l_0_0 = mp.getfilesize()
if 230000 < l_0_0 and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
