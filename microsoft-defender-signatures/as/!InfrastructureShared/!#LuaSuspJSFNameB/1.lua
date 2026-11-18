-- Threat: !InfrastructureShared
-- Name: !#Lua:SuspJSFName.B
-- Type: 13
-- MpAttributes: Lua:JSExt & !SCRIPT:WhiteListedJSFile & !SCPT:Nemucod_exclusion

local l_0_0, l_0_1
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_2 == mp.SCANREASON_ONOPEN or l_0_2 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
end
if l_0_0 == nil then
  l_0_1 = string.lower(mp.getfilename())
  if l_0_1 == nil then
    return mp.CLEAN
  end
  l_0_0 = l_0_1:match("([^\\]+)$")
end
if l_0_0 ~= nil and (string.match(l_0_0, "^invoice%-") or string.match(l_0_0, "^invoices%-") or string.match(l_0_0, "^invoice_") or string.match(l_0_0, "^kpinvoice_") or string.match(l_0_0, "^scan%-%d+") or string.match(l_0_0, "^scan%-%a+%-%d+%-.+") or string.match(l_0_0, "^cust%-%a+%-%d+%-.+") or string.match(l_0_0, "^order%-") or string.match(l_0_0, "^inv%-%a+%-%d+%-.+") or string.match(l_0_0, "^payment%-") or string.match(l_0_0, "^acknowledgement%-") or string.match(l_0_0, "^rechnung%-") or string.match(l_0_0, "^rechnungs%-") or string.match(l_0_0, "^gescanntes%-") or string.match(l_0_0, "^rech%-%d+") or string.match(l_0_0, "^rech%-%a+%-%d+%-.+") or string.match(l_0_0, "^ups__") or string.match(l_0_0, "^view__report") or string.match(l_0_0, "^document__%d+") or string.match(l_0_0, "^re%-invoice%-") or string.match(l_0_0, "^dhl__") or string.match(l_0_0, "^no%-%a+%-%d+%-.+")) then
  return mp.INFECTED
end
return mp.CLEAN
