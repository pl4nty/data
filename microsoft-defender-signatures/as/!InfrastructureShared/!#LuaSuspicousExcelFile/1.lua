-- Threat: !InfrastructureShared
-- Name: !#Lua:SuspicousExcelFile
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & BM_OLE_FILE

if mp.HEADERPAGE_SZ < 4095 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 2561) ~= 218959105 then
  return mp.CLEAN
end
if headerpage[2565] ~= 93 then
  return mp.CLEAN
end
mp.set_mpattribute("Lua:SuspiciousOfficeHeaderS101")
return mp.CLEAN
