-- Threat: !InfrastructureShared
-- Name: 13c78957a3a3b
-- Type: 21

if (hstrlog[1].matched or hstrlog[2].matched) and (hstrlog[3].matched or hstrlog[4].matched or hstrlog[5].matched) then
  local l_0_0 = mp.getfilesize()
  if 1500000 <= l_0_0 and l_0_0 <= 2000000 and pesecs[1].Name == "UPX0" or 3300000 <= l_0_0 and l_0_0 <= 4000000 then
    return mp.INFECTED
  end
end
return mp.CLEAN
