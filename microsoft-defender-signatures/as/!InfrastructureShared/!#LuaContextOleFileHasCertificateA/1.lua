-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/OleFileHasCertificate.A
-- Type: 13
-- MpAttributes: BM_OLE_FILE & (RPF:TopLevelFile | RPF:AnyFileHasIOAVURL) & !Lua:MsWordExt & !Lua:MsExcelExt

local l_0_0 = false
local l_0_1 = mp.GetCertificateInfo()
for l_0_2, l_0_3 in pairs(l_0_1) do
  if l_0_3.Signers ~= nil then
    l_0_0 = true
    break
  end
end
if l_0_0 == true then
  mp.set_mpattribute("Lua:OleFileHasCertificate")
elseif l_0_0 == false then
  mp.set_mpattribute("Lua:OleFileHasNoCertificate")
end
return mp.CLEAN
