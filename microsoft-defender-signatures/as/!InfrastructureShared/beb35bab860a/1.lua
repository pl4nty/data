-- Threat: !InfrastructureShared
-- Name: beb35bab860a
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_imagepath()
if isTainted(l_0_0, "remote_file_created_taint") then
  return mp.INFECTED
end
return mp.CLEAN
