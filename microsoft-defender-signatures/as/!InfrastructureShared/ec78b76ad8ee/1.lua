-- Threat: !InfrastructureShared
-- Name: ec78b76ad8ee
-- Type: 21

if not peattributes.isexe and not peattributes.isdll then
  return mp.CLEAN
end
if mp.getfilesize() > 512000 then
  return mp.CLEAN
end
local l_0_0 = mp.GetCertificateInfo()
for l_0_1, l_0_2 in pairs(l_0_0) do
  if l_0_2.Signers ~= nil then
    return mp.CLEAN
  end
end
local l_0_3 = pe.query_import
if 0 == l_0_3(pe.IMPORT_STATIC, 3223371184) then
  return mp.CLEAN
end
if 0 == l_0_3(pe.IMPORT_STATIC, 881337578) then
  return mp.CLEAN
end
if 0 == l_0_3(pe.IMPORT_STATIC, 1185677909) then
  return mp.CLEAN
end
if 0 == l_0_3(pe.IMPORT_STATIC, 1706465794) then
  return mp.CLEAN
end
return mp.INFECTED
