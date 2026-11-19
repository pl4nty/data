-- Threat: !InfrastructureShared
-- Name: 85b3832d79ee
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil then
    local l_0_4 = mp.bitand(l_0_3.reason_ex, 1)
    local l_0_5 = string.lower(l_0_3.image_path)
    if l_0_4 == 1 and (string.find(l_0_5, "\\excel.exe", 1, true) or string.find(l_0_5, "\\winword.exe", 1, true) or string.find(l_0_5, "\\eqnedt32.exe", 1, true) or string.find(l_0_5, "\\powerpnt.exe", 1, true) or string.find(l_0_5, "\\wscript.exe", 1, true) or string.find(l_0_5, "\\cscript.exe", 1, true)) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
