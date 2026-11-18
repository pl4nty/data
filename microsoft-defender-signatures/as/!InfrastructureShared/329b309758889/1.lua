-- Threat: !InfrastructureShared
-- Name: 329b309758889
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1 = bm.get_process_relationships()
if l_0_0 then
  for l_0_2, l_0_3 in ipairs(l_0_0) do
    if l_0_3.ppid and l_0_3.image_path then
      local l_0_4 = string.lower(l_0_3.image_path)
      if string.find(l_0_4, "java.exe", 1, true) and mp.bitand(l_0_3.reason_ex, 1) == 1 then
        local l_0_5, l_0_6 = pcall(reportBmInfo)
        if not l_0_5 and l_0_6 then
          bm.add_related_string("bmInfoFailReason", tostring(l_0_6), bm.RelatedStringBMReport)
        end
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
