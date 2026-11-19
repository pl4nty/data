-- Threat: !InfrastructureShared
-- Name: !#Lua:SuspiciousPdfFilename
-- Type: 13
-- MpAttributes: Lua:PDFExt & BM_PDF_FILE

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
if l_0_0 ~= nil and (string.match(l_0_0, "^confidential") or string.match(l_0_0, "^dhl") or string.match(l_0_0, "^fidelity") or string.match(l_0_0, "^fedex") or string.match(l_0_0, "^freemobile") or string.match(l_0_0, "^invoice") or string.match(l_0_0, "^parcel") or string.match(l_0_0, "^payment") or string.match(l_0_0, "^po.#") or string.match(l_0_0, "^po.+order") or string.match(l_0_0, "^po%d%d%d%d") or string.match(l_0_0, "^purchase.order") or string.match(l_0_0, "^quotation") or string.match(l_0_0, "^%d%d%d%d%d%d%d.pdf") or string.match(l_0_0, "^document.%d+") or string.match(l_0_0, "^shipment") or string.match(l_0_0, "pending.+deposit") or string.match(l_0_0, "mailbox.maintenance") or string.match(l_0_0, "account.safety") or string.match(l_0_0, "acct.review") or string.match(l_0_0, "delivery.details") or string.match(l_0_0, "important.update") or string.match(l_0_0, "security.+mail") or string.match(l_0_0, "bank.transaction") or string.match(l_0_0, "account.verification") or string.match(l_0_0, "money.transfer") or string.match(l_0_0, "money.+confirmation") or string.match(l_0_0, "new.order") or string.match(l_0_0, "notification.letter") or string.match(l_0_0, "violation.message") or string.match(l_0_0, "transfer.instruction") or string.match(l_0_0, "doc.pdf") or string.match(l_0_0, "new.message") or string.match(l_0_0, "new.purchase")) then
  return mp.INFECTED
end
return mp.CLEAN
