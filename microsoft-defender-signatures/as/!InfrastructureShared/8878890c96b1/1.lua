-- Threat: !InfrastructureShared
-- Name: 8878890c96b1
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 ~= nil and 7168000 <= l_0_0 and l_0_0 <= 10240000 then
  if not mp.get_mpattribute("do_exhaustivehstr_64bit_rescan") then
    mp.set_mpattribute("do_exhaustivehstr_64bit_rescan")
  end
  return mp.INFECTED
end
return mp.CLEAN
