-- Threat: !InfrastructureShared
-- Name: 817894e55636
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 65536 <= l_0_0 and l_0_0 <= 131072 and mp.get_mpattribute("NID:Buran.A!Pra1") then
  return mp.INFECTED
end
return mp.CLEAN
