-- Threat: !InfrastructureShared
-- Name: !#TEL:MpEnableE5AntiTampering
-- Type: 12

if true == MpCommon.NidSearch(mp.NID_ENABLE_EXTENDED_BAFS, 6) then
  mp.set_mpattribute("Lua:MpEnableE5EmergencyAntiTampering")
end
return mp.CLEAN
