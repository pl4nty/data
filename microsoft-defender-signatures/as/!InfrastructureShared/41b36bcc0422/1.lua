-- Threat: !InfrastructureShared
-- Name: 41b36bcc0422
-- Type: 21

local l_0_0
local l_0_1 = string.lower(bm.get_imagepath())
if string.sub(l_0_1, -13) == "\\sqlservr.exe" or string.sub(l_0_1, -13) == "\\sqlagent.exe" then
  l_0_0 = true
end
if not l_0_0 then
  local l_0_2, l_0_3 = bm.get_process_relationships()
  for l_0_4, l_0_5 in ipairs(l_0_2) do
    if l_0_5.image_path ~= nil and mp.bitand(l_0_5.reason_ex, 1) == 1 and (string.lower(string.sub(l_0_5.image_path, -13)) == "\\sqlservr.exe" or string.lower(string.sub(l_0_5.image_path, -13)) == "\\sqlagent.exe") then
      l_0_0 = true
      break
    end
  end
end
if l_0_0 ~= nil then
  local l_0_6
  if this_sigattrlog[3].matched then
    l_0_6 = this_sigattrlog[3].utf8p2
  end
  if l_0_6 ~= nil then
    local l_0_7 = l_0_6:match("Detection:([^\\]+)$")
    bm.trigger_sig(l_0_7, "MalwareDroppedBySQL")
    return mp.INFECTED
  end
end
return mp.CLEAN
