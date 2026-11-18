-- Threat: !InfrastructureShared
-- Name: e07837b56305
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 ~= nil and peattributes.isdll == true and 102400 <= l_0_0 and l_0_0 <= 614400 then
  return mp.INFECTED
end
return mp.CLEAN
