-- Threat: !InfrastructureShared
-- Name: 95b38261e02f
-- Type: 21

if this_sigattrlog[2].matched then
  local l_0_0 = this_sigattrlog[2].utf8p1
  if l_0_0 ~= nil and string.len(l_0_0) > 4 and string.sub(l_0_0, -4) == ".lnk" then
    local l_0_1, l_0_2 = bm.get_process_relationships()
    for l_0_3, l_0_4 in ipairs(l_0_1) do
      if l_0_4.image_path ~= nil then
        local l_0_5 = mp.bitand(l_0_4.reason_ex, 1)
        if l_0_5 == 1 and string.find(string.lower(l_0_4.image_path), "\\regsvr32.exe", 1, true) then
          bm.add_threat_process(l_0_4.ppid)
          break
        end
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
