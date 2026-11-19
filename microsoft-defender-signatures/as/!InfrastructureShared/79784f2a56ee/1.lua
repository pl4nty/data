-- Threat: !InfrastructureShared
-- Name: 79784f2a56ee
-- Type: 21

if mp.get_mpattribute("MpHasExpensiveLoop") and peattributes.epatstartentrysect then
  return mp.SUSPICIOUS
end
return mp.LOWFI
