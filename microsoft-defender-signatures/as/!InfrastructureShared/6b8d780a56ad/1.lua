-- Threat: !InfrastructureShared
-- Name: 6b8d780a56ad
-- Type: 21

local l_0_0 = mp.getfilesize()
if mp.HSTR_WEIGHT >= 4 and l_0_0 < 327680 then
  mp.set_mpattribute("PUA:Block:Bundlore.R")
  return mp.INFECTED
end
return mp.LOWFI
