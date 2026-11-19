-- Threat: !InfrastructureShared
-- Name: 4eb3a2e4fb4d
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil or string.len(l_0_0) < 1 then
  return mp.CLEAN
end
if string.find(string.lower(l_0_0), "\\program files", 1, true) or string.find(string.lower(l_0_0), "\\mpsigstub.exe", 1, true) or string.find(string.lower(l_0_0), "\\mpcmdrun.exe", 1, true) then
  return mp.CLEAN
end
if string.find(l_0_0, "\\lsass.exe", 1, true) then
  local l_0_1, l_0_2 = bm.get_process_relationships()
  if l_0_1 then
    for l_0_3, l_0_4 in ipairs(l_0_1) do
      if l_0_4.image_path ~= nil and mp.bitand(l_0_4.reason_ex, 2) == 2 then
        local l_0_5 = string.lower(l_0_4.image_path)
        if string.find(l_0_5, "\\dell secureworks\\red cloak\\[^\\]+\\entwine.exe") or string.find(l_0_5, "\\program files\\morphisec\\bin\\protectorservice64.exe", 1, true) or string.find(l_0_5, "\\sentinelone\\sentinel agent[^\\]+\\sentinelagent.exe") then
          return mp.CLEAN
        end
      end
    end
  end
end
return mp.INFECTED
