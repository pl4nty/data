-- Threat: !InfrastructureShared
-- Name: 7778ad3db9de
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == false and 589824 < l_0_0 and l_0_0 < 655360 then
  return mp.INFECTED
end
return mp.LOWFI
