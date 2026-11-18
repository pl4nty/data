-- Threat: !InfrastructureShared
-- Name: 41b3bf42197c
-- Type: 21

if this_sigattrlog[1].matched == false then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[1].ppid
local l_0_1, l_0_2 = bm.get_process_relationships(l_0_0)
if l_0_1 == nil or #l_0_1 < 1 then
  return mp.CLEAN
end
local l_0_3
for l_0_4, l_0_5 in ipairs(l_0_1) do
  if mp.bitand(l_0_5.reason_ex, 1) == 1 and string.len(l_0_5.image_path) > 15 and string.sub(l_0_5.image_path, -15) == "\\powershell.exe" then
    l_0_3 = l_0_5.ppid
    bm.add_related_process(l_0_5.ppid)
    break
  end
end
if l_0_3 == nil then
  return mp.CLEAN
end
return mp.INFECTED
