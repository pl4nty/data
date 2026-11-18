-- Threat: !InfrastructureShared
-- Name: 43b34218e4d7
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = "suid_file_taint"
local l_0_1 = bm.get_imagepath()
if not l_0_1 or not isTainted(l_0_1, l_0_0) then
  return mp.CLEAN
end
return mp.INFECTED
