-- Threat: !InfrastructureShared
-- Name: 143b386e39f98
-- Type: 21

local l_0_0 = false
local l_0_1 = false
local l_0_2
local l_0_3, l_0_4 = bm.get_process_relationships()
for l_0_5, l_0_6 in ipairs(l_0_3) do
  l_0_2 = l_0_6.ppid
  local l_0_7, l_0_8 = bm.get_process_relationships(l_0_2)
  for l_0_9, l_0_10 in ipairs(l_0_7) do
    if l_0_10.image_path ~= nil then
      local l_0_11 = string.lower(MpCommon.PathToWin32Path(l_0_10.image_path))
      if not string.find(l_0_11, "\\notepad.exe", -12, true) then
        local l_0_12 = l_0_10.ppid
        if sysio.IsFileExists(l_0_11) and not mp.IsKnownFriendlyFile(l_0_11, true, false) then
          bm.add_related_file(l_0_11)
          bm.request_SMS(l_0_12, "m+")
          l_0_0 = true
        end
      end
    end
  end
  if not MpCommon.IsFriendlyProcess(l_0_2) then
    bm.add_related_process(l_0_2)
    bm.request_SMS(l_0_2, "m+")
    l_0_1 = true
  end
end
if l_0_0 == false and l_0_3 ~= nil and l_0_1 == false then
  bm.request_SMS(l_0_2, "m+")
end
return mp.INFECTED
