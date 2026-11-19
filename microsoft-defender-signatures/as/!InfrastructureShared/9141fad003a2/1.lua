-- Threat: !InfrastructureShared
-- Name: 9141fad003a2
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
if this_sigattrlog[2].matched and this_sigattrlog[3].matched then
  local l_0_3 = this_sigattrlog[2].p1
  local l_0_4 = this_sigattrlog[3].p1
  if string.match(l_0_3:lower() .. l_0_4:lower(), "safe") then
    return mp.INFECTED
  end
end
return mp.LOWFI
