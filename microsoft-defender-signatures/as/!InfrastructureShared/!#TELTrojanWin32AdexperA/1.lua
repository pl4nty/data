-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:Win32/Adexper.A
-- Type: 12
-- MpAttributes: MpOnOpenOrCloseRtpScan & RPF:TopLevelFile

if mp.readu_u32(headerpage, 1) == 762210679 and mp.readu_u32(headerpage, 5) == 1865245793 and mp.readu_u16(headerpage, 8) == 25199 then
  mp.set_mpattribute("BM_ADEXPER_A")
  return mp.INFECTED
end
return mp.CLEAN
