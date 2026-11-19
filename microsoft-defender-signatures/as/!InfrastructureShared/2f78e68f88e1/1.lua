-- Threat: !InfrastructureShared
-- Name: 2f78e68f88e1
-- Type: 21

if not peattributes.isexe and not peattributes.isdll then
  return mp.CLEAN
end
if mp.getfilesize() > 5000000 then
  return mp.CLEAN
end
local l_0_0 = mp.GetCertificateInfo()
for l_0_1, l_0_2 in pairs(l_0_0) do
  if l_0_2.Signers ~= nil then
    return mp.CLEAN
  end
end
local l_0_3 = pe.query_import
if 0 == l_0_3(pe.IMPORT_STATIC, 933026593) then
  return mp.CLEAN
end
return mp.INFECTED
