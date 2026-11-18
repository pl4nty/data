-- Threat: !InfrastructureShared
-- Name: 1c09784b6a7c48
-- Type: 21

if hstrlog[1].matched then
  return mp.INFECTED
end
mp.set_mpattribute("HSTR:Trojan:Win32/Lznt_Xor8_Win32")
return mp.LOWFI
