-- Threat: !InfrastructureShared
-- Name: 51b367e746b1
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil and mp.bitand(l_0_3.reason_ex, 1) == 1 and (string.lower(string.sub(l_0_3.image_path, -13)) == "\\sqlservr.exe" or string.lower(string.sub(l_0_3.image_path, -13)) == "\\sqlagent.exe") then
    local l_0_4, l_0_5 = pcall(reportBmInfo)
    if not l_0_4 and l_0_5 then
      bm.add_related_string("bmInfoFailReason", tostring(l_0_5), bm.RelatedStringBMReport)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
