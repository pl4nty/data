-- Threat: !InfrastructureShared
-- Name: 4db3f223485f
-- Type: 21

if not this_sigattrlog[1].matched or this_sigattrlog[1].wp2 == nil then
  return mp.CLEAN
end
local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil and mp.bitand(l_0_3.reason_ex, 1) == 1 and (string.lower(string.sub(l_0_3.image_path, -12)) == "\\wscript.exe" or string.lower(string.sub(l_0_3.image_path, -12)) == "\\cscript.exe") then
    return mp.INFECTED
  end
end
return mp.CLEAN
