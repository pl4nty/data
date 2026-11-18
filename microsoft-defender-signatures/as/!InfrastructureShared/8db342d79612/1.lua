-- Threat: !InfrastructureShared
-- Name: 8db342d79612
-- Type: 21

function checkProcessTree(l_1_0, l_1_1)
  if l_1_0 == nil or l_1_1 == nil or type(l_1_1) ~= "table" then
    return nil
  end
  local l_1_2 = l_1_0
  local l_1_3 = {}
  for l_1_4, l_1_5 in ipairs(l_1_1) do
    local l_1_6 = 0
    local l_1_7, l_1_8 = bm.get_process_relationships(l_1_2)
    for l_1_9, l_1_10 in ipairs(l_1_8) do
      if mp.bitand(l_1_10.reason_ex, 1) == 1 and string.sub(l_1_10.image_path, -string.len(l_1_5)) == l_1_5 then
        l_1_2 = l_1_10.ppid
        l_1_6 = l_1_6 + 1
      end
      if 1 < l_1_6 then
        return nil
      end
    end
    if l_1_6 == 0 then
      return nil
    end
    table.insert(l_1_3, l_1_2)
  end
  return l_1_3
end

if bm.GetSignatureMatchDuration() > 300000000 then
  return mp.CLEAN
end
local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.ppid
local l_0_2 = {
  "cmd.exe",
  "cmd.exe",
  "powershell.exe"
}
local l_0_3 = checkProcessTree(l_0_1, l_0_2)
if l_0_3 == nil then
  return mp.CLEAN
end
return mp.INFECTED
