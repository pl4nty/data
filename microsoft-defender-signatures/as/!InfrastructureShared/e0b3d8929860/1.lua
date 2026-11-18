-- Threat: !InfrastructureShared
-- Name: e0b3d8929860
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_imagepath()
if l_0_0 and isTainted(l_0_0, "obfuscated_golang") then
  bm.add_related_file(l_0_0)
  addRelatedProcess()
  return mp.INFECTED
end
return mp.CLEAN
