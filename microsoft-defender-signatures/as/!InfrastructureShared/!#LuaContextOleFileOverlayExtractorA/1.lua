-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/OleFileOverlayExtractor.A
-- Type: 13
-- MpAttributes: RPF:OleFileHasOverlay & BM_OLE_FILE & RPF:TopLevelFile & (!Lua:MsOfficeExt & !Lua:MSIExt)

local l_0_0 = mp.get_mpattributevalue("RPF:OleFileHasOverlay")
if l_0_0 == nil or l_0_0 <= 80 then
  return mp.CLEAN
end
local l_0_1 = false
local l_0_2 = mp.GetCertificateInfo()
for l_0_3, l_0_4 in pairs(l_0_2) do
  if l_0_4.Signers ~= nil then
    l_0_1 = true
    break
  end
end
if l_0_1 == false then
  mp.set_mpattribute("Lua:OleFileOverlayNoCert.A")
  return mp.CLEAN
end
local l_0_5 = mp.getfilesize()
if l_0_5 == nil or l_0_0 >= l_0_5 then
  return mp.CLEAN
end
local l_0_6 = l_0_5 - l_0_0
if l_0_6 <= 5120000 then
  mp.vfo_add_filechunk(l_0_0, l_0_6, "[OleFileOverlay]", 1)
  return mp.INFECTED
else
  mp.set_mpattribute("Lua:OleFileOverlayOverSizeLimit.A")
end
return mp.CLEAN
