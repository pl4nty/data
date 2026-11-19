-- Threat: !InfrastructureShared
-- Name: 12a61eecb5df0
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and peattributes.no_security == true and 73728 <= l_0_0 and l_0_0 <= 4390912 then
  return mp.INFECTED
end
return mp.LOWFI
