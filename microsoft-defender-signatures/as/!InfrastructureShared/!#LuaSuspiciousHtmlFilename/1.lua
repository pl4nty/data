-- Threat: !InfrastructureShared
-- Name: !#Lua:SuspiciousHtmlFilename
-- Type: 13
-- MpAttributes: Lua:HTMLExt | Lua:HTMExt

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
if l_0_0 ~= nil and (l_0_0 == "outlook.html" or l_0_0 == "outlook.htm" or l_0_0 == "statement.html" or l_0_0 == "statement.htm" or l_0_0 == "irregularactivityfile.html" or l_0_0 == "irregularactivityfile.htm" or l_0_0 == "assistenza_clienti.html" or l_0_0 == "assistenza_clienti.htm" or l_0_0 == "your account balance.html" or l_0_0 == "Your Account Balance.htm" or l_0_0 == "new order.html" or l_0_0 == "new order.htm" or l_0_0 == "p.o.html" or l_0_0 == "p.o.htm" or l_0_0 == "price_list.html" or l_0_0 == "price_list.htm" or l_0_0 == "quotation.html" or l_0_0 == "quotation.htm" or string.match(l_0_0, "^new po # .%d+") or string.match(l_0_0, "^bank.document") or string.match(l_0_0, "^bank.copy#%d+") or string.match(l_0_0, "^purchaseorder") or string.match(l_0_0, "^purchase.order") or string.match(l_0_0, "^form.id") or string.match(l_0_0, "^barclays") or string.match(l_0_0, "^paypal") or string.match(l_0_0, "^restore_access") or string.match(l_0_0, "^apple.online") or string.match(l_0_0, "^form%d+") or string.match(l_0_0, "^document%d+") or string.match(l_0_0, "^attachment%d+") or string.match(l_0_0, "^secure.account") or string.match(l_0_0, "^refund.form") or string.match(l_0_0, "^pp%-%d+%-%d+%-") or string.match(l_0_0, "^pp.form") or string.match(l_0_0, "^tax.refund") or string.match(l_0_0, "^purchase.order") or string.match(l_0_0, "^case.id.number") or string.match(l_0_0, "^account.information") or string.match(l_0_0, "^postepay") or string.match(l_0_0, "^modulo.cliente") or string.match(l_0_0, "^payment.slip") or string.match(l_0_0, "^suspension.alert") or string.match(l_0_0, "^card.details") or string.match(l_0_0, "^hotmail") or string.match(l_0_0, "^po#%d+") or string.match(l_0_0, "^trail.PO.#") or string.match(l_0_0, "^scan.invoice") or string.match(l_0_0, "^stamped.po") or string.match(l_0_0, "^invoice") or string.match(l_0_0, "^po.%d+") or string.match(l_0_0, "^verification.form") or string.match(l_0_0, "^urgent") or string.match(l_0_0, "^amex") or string.match(l_0_0, "^scan.%d+") or string.match(l_0_0, "^excel%d+") or string.match(l_0_0, "^new.order") or string.match(l_0_0, "banking.update.form%.htm") or string.match(l_0_0, "banking.details") or string.match(l_0_0, "amex.message") or string.match(l_0_0, "limited.+access") or string.find(l_0_0, ".pdf.htm", 1, true) ~= nil or string.find(l_0_0, ".xls.htm", 1, true) ~= nil or string.find(l_0_0, ".xlsx.htm", 1, true) ~= nil or string.find(l_0_0, ".doc.htm", 1, true) ~= nil or string.find(l_0_0, ".docx.htm", 1, true) ~= nil or string.find(l_0_0, "paypal.htm", 1, true) ~= nil or string.find(l_0_0, "verification.htm", 1, true) ~= nil or string.find(l_0_0, "online.htm", 1, true) ~= nil or string.find(l_0_0, "securizza.htm", 1, true) ~= nil or string.find(l_0_0, "online banking", 1, true) ~= nil or string.find(l_0_0, "security.htm", 1, true) ~= nil or string.find(l_0_0, "tax refund", 1, true) ~= nil or string.find(l_0_0, "suspension.htm", 1, true) ~= nil or string.find(l_0_0, "refund.htm", 1, true) ~= nil or string.find(l_0_0, "refund form.htm", 1, true) ~= nil or string.find(l_0_0, "onlinebanking.htm", 1, true) ~= nil or string.find(l_0_0, "update form.htm", 1, true) ~= nil or string.find(l_0_0, "usd slip.htm", 1, true) ~= nil or string.find(l_0_0, "urgent order", 1, true) ~= nil or string.find(l_0_0, "verify.htm", 1, true) ~= nil or string.find(l_0_0, "secured.htm", 1, true) ~= nil) then
  return mp.INFECTED
end
return mp.CLEAN
