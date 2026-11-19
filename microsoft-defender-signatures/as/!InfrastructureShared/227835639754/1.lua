-- Threat: !InfrastructureShared
-- Name: 227835639754
-- Type: 21

local l_0_0 = mp.getfilesize()
if 307200 < l_0_0 and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
