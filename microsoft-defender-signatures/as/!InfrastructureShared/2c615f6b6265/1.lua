-- Threat: !InfrastructureShared
-- Name: 2c615f6b6265
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == false and 950272 < l_0_0 and l_0_0 < 978944 and mp.get_mpattribute("TEL:Ransom:Win32/Megacortex!sl001") then
  return mp.INFECTED
end
return mp.CLEAN
