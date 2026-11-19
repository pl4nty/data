-- Threat: !InfrastructureShared
-- Name: 51b3f8419c3d
-- Type: 21

local l_0_0 = 3
if bm.GetSignatureMatchDuration() > l_0_0 * 10000000 then
  return mp.CLEAN
end
local l_0_1 = string.lower(bm.get_imagepath())
if l_0_1 == nil or string.len(l_0_1) < 1 then
  return mp.CLEAN
end
if string.find(string.lower(l_0_1), "\\program files", 1, true) or string.find(string.lower(l_0_1), "\\mpsigstub.exe", 1, true) or string.find(string.lower(l_0_1), "\\mpcmdrun.exe", 1, true) then
  return mp.CLEAN
end
local l_0_2, l_0_3 = bm.get_process_relationships()
for l_0_4, l_0_5 in ipairs(l_0_2) do
  if l_0_5.image_path ~= nil then
    local l_0_6 = mp.bitand(l_0_5.reason_ex, 1)
    if l_0_6 == 1 and string.find(string.lower(l_0_5.image_path), "\\powershell.exe", 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
