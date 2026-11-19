-- Threat: !InfrastructureShared
-- Name: 203781440c6f8
-- Type: 21

if not peattributes.isexe or not peattributes.hasexports then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pe.get_exports()
if l_0_0 ~= 2 then
  return mp.CLEAN
end
local l_0_2 = pe.mmap_string_rva(l_0_1[2].namerva, 64)
if l_0_2 ~= "__dbk_fcall_wrapper" then
  return mp.CLEAN
end
local l_0_3 = mp.GetCertificateInfo()
for l_0_4, l_0_5 in pairs(l_0_3) do
  if l_0_5.Signers ~= nil then
    return mp.CLEAN
  end
end
return mp.INFECTED
