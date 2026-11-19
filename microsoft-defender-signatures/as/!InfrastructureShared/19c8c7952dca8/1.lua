-- Threat: !InfrastructureShared
-- Name: 19c8c7952dca8
-- Type: 21

if hstrlog[1].matched then
  if hstrlog[1].hitcount >= 3 and mp.getfilesize() <= 131072 and mp.getfilesize() >= 4096 then
    local l_0_0 = mp.readheader(0, 1024)
    local l_0_1 = mp.readfooter(mp.FOOTERPAGE_SZ - 1024, 1024)
    if string.find(l_0_0, "MAD!", 1, true) ~= nil and string.find(l_0_1, "MAD!", 1, true) ~= nil then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end
return mp.INFECTED
