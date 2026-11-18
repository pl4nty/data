-- Threat: !InfrastructureShared
-- Name: 41b380a6630b
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil and mp.bitand(l_0_3.reason_ex, 1) == 1 and string.find(string.lower(l_0_3.image_path), "\\powershell.exe", 1, true) then
    local l_0_4 = string.lower(mp.GetProcessCommandLine(l_0_3.ppid))
    if string.find(l_0_4, "invoke-expression %$env:") or string.find(l_0_4, "iex %$env:") then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
