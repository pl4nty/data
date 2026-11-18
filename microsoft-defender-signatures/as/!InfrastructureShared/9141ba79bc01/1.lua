-- Threat: !InfrastructureShared
-- Name: 9141ba79bc01
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
if this_sigattrlog[4].matched and this_sigattrlog[5].matched then
  local l_0_3 = this_sigattrlog[4].p1
  local l_0_4 = this_sigattrlog[5].p1
  if l_0_3:lower() .. l_0_4:lower() == "unsafe" then
    return mp.INFECTED
  end
end
return mp.LOWFI
