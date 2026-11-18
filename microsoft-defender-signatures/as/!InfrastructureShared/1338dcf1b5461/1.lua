-- Threat: !InfrastructureShared
-- Name: 1338dcf1b5461
-- Type: 21

local l_0_0 = mp.getfilesize()
if mp.HSTR_WEIGHT >= 6 and l_0_0 < 327680 then
  mp.set_mpattribute("PUA:Block:Bundlore.P")
  return mp.INFECTED
end
return mp.LOWFI
