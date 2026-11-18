-- Threat: !InfrastructureShared
-- Name: bd786f2a3583
-- Type: 21

local l_0_0 = mp.getfilesize()
if 516096 <= l_0_0 and l_0_0 <= 524288 and mp.get_mpattribute("TEL:Trojan:Win32/Emotet.PAC!Lowfi") then
  return mp.INFECTED
end
return mp.CLEAN
