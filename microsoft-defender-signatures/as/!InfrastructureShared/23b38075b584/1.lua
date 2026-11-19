-- Threat: !InfrastructureShared
-- Name: 23b38075b584
-- Type: 21

local l_0_0 = 0
if this_sigattrlog[1].matched then
  local l_0_1
  local l_0_2, l_0_3 = bm.get_process_relationships()
  for l_0_4, l_0_5 in ipairs(l_0_2) do
    l_0_1 = l_0_5.image_path
    if string.find(l_0_1, "\\WINWORD.EXE") then
      l_0_0 = l_0_0 + 1
      break
    end
  end
  local l_0_6
  for l_0_7, l_0_8 in ipairs(l_0_3) do
    l_0_6 = l_0_8.image_path
    if string.find(l_0_6, "\\powershell.exe") or string.find(l_0_6, "\\cmd.exe") then
      l_0_0 = l_0_0 + 1
      break
    end
  end
  if l_0_0 == 2 then
    return mp.INFECTED
  end
end
return mp.CLEAN
