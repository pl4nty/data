-- Threat: !InfrastructureShared
-- Name: 15b34d2baedd
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil then
    if contains(l_0_3.image_path, "regsvr32.exe") then
      return mp.INFECTED
    else
      local l_0_4 = MpCommon.GetOriginalFileName(l_0_3.image_path)
      if contains(l_0_4, "regsvr32.exe") then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
