-- Threat: !InfrastructureShared
-- Name: 49bb3585551c5
-- Type: 21

local l_0_0, l_0_1
l_0_0 = bm.get_imagepath()
if this_sigattrlog[7].matched then
  l_0_1 = this_sigattrlog[7].utf8p2
end
if l_0_0 then
  l_0_0 = string.lower(l_0_0)
  if string.find(l_0_0, "\\services.exe", -13, true) and (string.find(l_0_0, "\\windows\\system32\\", -30, true) or string.find(l_0_0, "\\windows\\winsxs\\", 1, true)) then
    return mp.CLEAN
  end
  if string.find(l_0_0, "\\reg.exe", -8, true) or string.find(l_0_0, "\\regedit.exe", -12, true) or string.find(l_0_0, "\\powershell.exe", -15, true) or string.find(l_0_0, "\\cmd.exe", -8, true) then
    local l_0_2, l_0_3 = bm.get_process_relationships()
    if l_0_2 then
      for l_0_4, l_0_5 in ipairs(l_0_2) do
        if l_0_5.ppid and mp.bitand(l_0_5.reason_ex, 1) == 1 then
          bm.add_related_process(l_0_5.ppid)
        end
      end
    end
  end
end
if l_0_1 then
  l_0_1 = string.lower(l_0_1)
  if string.find(l_0_1, "\\programdata\\microsoft\\windows defender\\definition updates\\{%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x}\\mpksldrv%.sys") then
    return mp.CLEAN
  end
end
return mp.INFECTED
