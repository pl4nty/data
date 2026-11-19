-- Threat: !InfrastructureShared
-- Name: e778379ec799
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and peattributes.no_security == true and 131072 <= l_0_0 and l_0_0 <= 139264 then
  return mp.INFECTED
end
return mp.CLEAN
