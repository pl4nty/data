-- Threat: !InfrastructureShared
-- Name: 55b3765479a4
-- Type: 21

if this_sigattrlog[3].matched == false or this_sigattrlog[3].utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[3].utf8p1
local l_0_1 = "\\wmiprvse.exe"
local l_0_2 = string.len(l_0_1)
local l_0_3 = false
local l_0_4, l_0_5 = bm.get_process_relationships()
for l_0_6, l_0_7 in ipairs(l_0_4) do
  if l_0_7.image_path ~= nil then
    local l_0_8 = string.lower(l_0_7.image_path)
    local l_0_9 = mp.bitand(l_0_7.reason_ex, 1)
    if l_0_9 == 1 and l_0_2 < string.len(l_0_8) and string.sub(l_0_8, -l_0_2) == l_0_1 then
      l_0_3 = true
      break
    end
  end
end
if l_0_3 == false then
  return mp.CLEAN
end
mp.ReportLowfi(l_0_0, 2563793617)
return mp.INFECTED
