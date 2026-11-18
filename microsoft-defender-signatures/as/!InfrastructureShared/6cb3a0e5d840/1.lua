-- Threat: !InfrastructureShared
-- Name: 6cb3a0e5d840
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = bm.get_imagepath()
if StringEndsWith(l_0_0, "/sudo") then
  return mp.CLEAN
end
return mp.INFECTED
