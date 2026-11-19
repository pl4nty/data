-- Threat: !InfrastructureShared
-- Name: fa7846cc43cb
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.ismsil == true and (6656 < l_0_0 and l_0_0 < 8192 or 139264 < l_0_0 and l_0_0 < 151552) then
  return mp.INFECTED
end
return mp.CLEAN
