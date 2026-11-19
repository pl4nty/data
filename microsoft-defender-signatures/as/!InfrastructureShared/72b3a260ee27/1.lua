-- Threat: !InfrastructureShared
-- Name: 72b3a260ee27
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = {
  "rundll32.exe",
  "regsvr32.exe"
}
local l_0_1, l_0_2 = bm.get_process_relationships()
for l_0_3, l_0_4 in ipairs(l_0_1) do
  if l_0_4.image_path ~= nil then
    if contains(l_0_4.image_path, l_0_0) then
      return mp.INFECTED
    else
      local l_0_5 = MpCommon.GetOriginalFileName(l_0_4.image_path)
      if contains(l_0_5, l_0_0) then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
