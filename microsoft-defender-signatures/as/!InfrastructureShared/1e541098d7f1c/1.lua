-- Threat: !InfrastructureShared
-- Name: 1e541098d7f1c
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
local l_0_0 = mp.GetCertificateInfo()
for l_0_1, l_0_2 in pairs(l_0_0) do
  if l_0_2.Signers ~= nil then
    return mp.CLEAN
  end
end
if this_sigattrlog[1].matched then
  local l_0_3 = this_sigattrlog[1].p1
  if string.match(l_0_3:lower(), "^[a-z]+$") and string.len(l_0_3) > 20 then
    return mp.INFECTED
  end
end
return mp.LOWFI
