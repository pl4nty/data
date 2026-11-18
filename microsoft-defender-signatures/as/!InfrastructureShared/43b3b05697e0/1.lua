-- Threat: !InfrastructureShared
-- Name: 43b3b05697e0
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if l_0_0 then
  local l_0_1 = string.match(l_0_0, "imagepath:([^;]+)")
  if l_0_1 then
    if isTainted(l_0_1, "upx_file_created_taint") then
      bm.add_related_file(l_0_1)
      return mp.INFECTED
    end
    if isTainted(l_0_1, "remote_file_created_taint") then
      bm.add_related_file(l_0_1)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
