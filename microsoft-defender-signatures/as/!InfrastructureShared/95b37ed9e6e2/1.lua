-- Threat: !InfrastructureShared
-- Name: 95b37ed9e6e2
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if mp.bitand(l_0_3.reason_ex, 1) == 1 and l_0_3.image_path and isTainted(l_0_3.image_path, "remote_file_created_taint") then
    addRelatedProcess()
    return mp.INFECTED
  end
end
return mp.CLEAN
