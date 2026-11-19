-- Threat: !InfrastructureShared
-- Name: 25b3cbdfd0e2
-- Type: 21

local l_0_0 = "\\powershell.exe"
local l_0_1 = string.len(l_0_0)
local l_0_2 = false
local l_0_3, l_0_4 = bm.get_process_relationships()
for l_0_5, l_0_6 in ipairs(l_0_3) do
  if l_0_6.image_path ~= nil then
    local l_0_7 = mp.bitand(l_0_6.reason_ex, 1)
    if l_0_7 == 1 and l_0_1 < string.len(l_0_6.image_path) and string.sub(l_0_6.image_path, -l_0_1) == l_0_0 then
      l_0_2 = true
      break
    end
  end
end
if l_0_2 == false then
  return mp.CLEAN
end
local l_0_8 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if l_0_8 ~= nil then
  mp.ReportLowfi(l_0_8, 3640120989)
end
return mp.INFECTED
