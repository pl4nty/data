local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_SCANREASON
L2_1 = L2_1(L3_1)
L3_1 = mp
L3_1 = L3_1.SCANREASON_ONOPEN
if L2_1 ~= L3_1 then
  L3_1 = mp
  L3_1 = L3_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L2_1 ~= L3_1 then
    goto lbl_20
  end
end
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_FILENAME
L3_1 = L3_1(L4_1)
L0_1 = L3_1
::lbl_20::
if L0_1 == nil then
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = mp
  L4_1 = L4_1.getfilename
  L4_1, L5_1, L6_1, L7_1 = L4_1()
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  L1_1 = L3_1
  if L1_1 == nil then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L4_1 = L1_1
  L3_1 = L1_1.match
  L5_1 = "([^\\]+)$"
  L3_1 = L3_1(L4_1, L5_1)
  L0_1 = L3_1
end
if L0_1 ~= nil then
  if L0_1 ~= "outlook.html" and L0_1 ~= "outlook.htm" and L0_1 ~= "statement.html" and L0_1 ~= "statement.htm" and L0_1 ~= "irregularactivityfile.html" and L0_1 ~= "irregularactivityfile.htm" and L0_1 ~= "assistenza_clienti.html" and L0_1 ~= "assistenza_clienti.htm" and L0_1 ~= "your account balance.html" and L0_1 ~= "Your Account Balance.htm" and L0_1 ~= "new order.html" and L0_1 ~= "new order.htm" and L0_1 ~= "p.o.html" and L0_1 ~= "p.o.htm" and L0_1 ~= "price_list.html" and L0_1 ~= "price_list.htm" and L0_1 ~= "quotation.html" and L0_1 ~= "quotation.htm" then
    L3_1 = string
    L3_1 = L3_1.match
    L4_1 = L0_1
    L5_1 = "^new po # .%d+"
    L3_1 = L3_1(L4_1, L5_1)
    if not L3_1 then
      L3_1 = string
      L3_1 = L3_1.match
      L4_1 = L0_1
      L5_1 = "^bank.document"
      L3_1 = L3_1(L4_1, L5_1)
      if not L3_1 then
        L3_1 = string
        L3_1 = L3_1.match
        L4_1 = L0_1
        L5_1 = "^bank.copy#%d+"
        L3_1 = L3_1(L4_1, L5_1)
        if not L3_1 then
          L3_1 = string
          L3_1 = L3_1.match
          L4_1 = L0_1
          L5_1 = "^purchaseorder"
          L3_1 = L3_1(L4_1, L5_1)
          if not L3_1 then
            L3_1 = string
            L3_1 = L3_1.match
            L4_1 = L0_1
            L5_1 = "^purchase.order"
            L3_1 = L3_1(L4_1, L5_1)
            if not L3_1 then
              L3_1 = string
              L3_1 = L3_1.match
              L4_1 = L0_1
              L5_1 = "^form.id"
              L3_1 = L3_1(L4_1, L5_1)
              if not L3_1 then
                L3_1 = string
                L3_1 = L3_1.match
                L4_1 = L0_1
                L5_1 = "^barclays"
                L3_1 = L3_1(L4_1, L5_1)
                if not L3_1 then
                  L3_1 = string
                  L3_1 = L3_1.match
                  L4_1 = L0_1
                  L5_1 = "^paypal"
                  L3_1 = L3_1(L4_1, L5_1)
                  if not L3_1 then
                    L3_1 = string
                    L3_1 = L3_1.match
                    L4_1 = L0_1
                    L5_1 = "^restore_access"
                    L3_1 = L3_1(L4_1, L5_1)
                    if not L3_1 then
                      L3_1 = string
                      L3_1 = L3_1.match
                      L4_1 = L0_1
                      L5_1 = "^apple.online"
                      L3_1 = L3_1(L4_1, L5_1)
                      if not L3_1 then
                        L3_1 = string
                        L3_1 = L3_1.match
                        L4_1 = L0_1
                        L5_1 = "^form%d+"
                        L3_1 = L3_1(L4_1, L5_1)
                        if not L3_1 then
                          L3_1 = string
                          L3_1 = L3_1.match
                          L4_1 = L0_1
                          L5_1 = "^document%d+"
                          L3_1 = L3_1(L4_1, L5_1)
                          if not L3_1 then
                            L3_1 = string
                            L3_1 = L3_1.match
                            L4_1 = L0_1
                            L5_1 = "^attachment%d+"
                            L3_1 = L3_1(L4_1, L5_1)
                            if not L3_1 then
                              L3_1 = string
                              L3_1 = L3_1.match
                              L4_1 = L0_1
                              L5_1 = "^secure.account"
                              L3_1 = L3_1(L4_1, L5_1)
                              if not L3_1 then
                                L3_1 = string
                                L3_1 = L3_1.match
                                L4_1 = L0_1
                                L5_1 = "^refund.form"
                                L3_1 = L3_1(L4_1, L5_1)
                                if not L3_1 then
                                  L3_1 = string
                                  L3_1 = L3_1.match
                                  L4_1 = L0_1
                                  L5_1 = "^pp%-%d+%-%d+%-"
                                  L3_1 = L3_1(L4_1, L5_1)
                                  if not L3_1 then
                                    L3_1 = string
                                    L3_1 = L3_1.match
                                    L4_1 = L0_1
                                    L5_1 = "^pp.form"
                                    L3_1 = L3_1(L4_1, L5_1)
                                    if not L3_1 then
                                      L3_1 = string
                                      L3_1 = L3_1.match
                                      L4_1 = L0_1
                                      L5_1 = "^tax.refund"
                                      L3_1 = L3_1(L4_1, L5_1)
                                      if not L3_1 then
                                        L3_1 = string
                                        L3_1 = L3_1.match
                                        L4_1 = L0_1
                                        L5_1 = "^purchase.order"
                                        L3_1 = L3_1(L4_1, L5_1)
                                        if not L3_1 then
                                          L3_1 = string
                                          L3_1 = L3_1.match
                                          L4_1 = L0_1
                                          L5_1 = "^case.id.number"
                                          L3_1 = L3_1(L4_1, L5_1)
                                          if not L3_1 then
                                            L3_1 = string
                                            L3_1 = L3_1.match
                                            L4_1 = L0_1
                                            L5_1 = "^account.information"
                                            L3_1 = L3_1(L4_1, L5_1)
                                            if not L3_1 then
                                              L3_1 = string
                                              L3_1 = L3_1.match
                                              L4_1 = L0_1
                                              L5_1 = "^postepay"
                                              L3_1 = L3_1(L4_1, L5_1)
                                              if not L3_1 then
                                                L3_1 = string
                                                L3_1 = L3_1.match
                                                L4_1 = L0_1
                                                L5_1 = "^modulo.cliente"
                                                L3_1 = L3_1(L4_1, L5_1)
                                                if not L3_1 then
                                                  L3_1 = string
                                                  L3_1 = L3_1.match
                                                  L4_1 = L0_1
                                                  L5_1 = "^payment.slip"
                                                  L3_1 = L3_1(L4_1, L5_1)
                                                  if not L3_1 then
                                                    L3_1 = string
                                                    L3_1 = L3_1.match
                                                    L4_1 = L0_1
                                                    L5_1 = "^suspension.alert"
                                                    L3_1 = L3_1(L4_1, L5_1)
                                                    if not L3_1 then
                                                      L3_1 = string
                                                      L3_1 = L3_1.match
                                                      L4_1 = L0_1
                                                      L5_1 = "^card.details"
                                                      L3_1 = L3_1(L4_1, L5_1)
                                                      if not L3_1 then
                                                        L3_1 = string
                                                        L3_1 = L3_1.match
                                                        L4_1 = L0_1
                                                        L5_1 = "^hotmail"
                                                        L3_1 = L3_1(L4_1, L5_1)
                                                        if not L3_1 then
                                                          L3_1 = string
                                                          L3_1 = L3_1.match
                                                          L4_1 = L0_1
                                                          L5_1 = "^po#%d+"
                                                          L3_1 = L3_1(L4_1, L5_1)
                                                          if not L3_1 then
                                                            L3_1 = string
                                                            L3_1 = L3_1.match
                                                            L4_1 = L0_1
                                                            L5_1 = "^trail.PO.#"
                                                            L3_1 = L3_1(L4_1, L5_1)
                                                            if not L3_1 then
                                                              L3_1 = string
                                                              L3_1 = L3_1.match
                                                              L4_1 = L0_1
                                                              L5_1 = "^scan.invoice"
                                                              L3_1 = L3_1(L4_1, L5_1)
                                                              if not L3_1 then
                                                                L3_1 = string
                                                                L3_1 = L3_1.match
                                                                L4_1 = L0_1
                                                                L5_1 = "^stamped.po"
                                                                L3_1 = L3_1(L4_1, L5_1)
                                                                if not L3_1 then
                                                                  L3_1 = string
                                                                  L3_1 = L3_1.match
                                                                  L4_1 = L0_1
                                                                  L5_1 = "^invoice"
                                                                  L3_1 = L3_1(L4_1, L5_1)
                                                                  if not L3_1 then
                                                                    L3_1 = string
                                                                    L3_1 = L3_1.match
                                                                    L4_1 = L0_1
                                                                    L5_1 = "^po.%d+"
                                                                    L3_1 = L3_1(L4_1, L5_1)
                                                                    if not L3_1 then
                                                                      L3_1 = string
                                                                      L3_1 = L3_1.match
                                                                      L4_1 = L0_1
                                                                      L5_1 = "^verification.form"
                                                                      L3_1 = L3_1(L4_1, L5_1)
                                                                      if not L3_1 then
                                                                        L3_1 = string
                                                                        L3_1 = L3_1.match
                                                                        L4_1 = L0_1
                                                                        L5_1 = "^urgent"
                                                                        L3_1 = L3_1(L4_1, L5_1)
                                                                        if not L3_1 then
                                                                          L3_1 = string
                                                                          L3_1 = L3_1.match
                                                                          L4_1 = L0_1
                                                                          L5_1 = "^amex"
                                                                          L3_1 = L3_1(L4_1, L5_1)
                                                                          if not L3_1 then
                                                                            L3_1 = string
                                                                            L3_1 = L3_1.match
                                                                            L4_1 = L0_1
                                                                            L5_1 = "^scan.%d+"
                                                                            L3_1 = L3_1(L4_1, L5_1)
                                                                            if not L3_1 then
                                                                              L3_1 = string
                                                                              L3_1 = L3_1.match
                                                                              L4_1 = L0_1
                                                                              L5_1 = "^excel%d+"
                                                                              L3_1 = L3_1(L4_1, L5_1)
                                                                              if not L3_1 then
                                                                                L3_1 = string
                                                                                L3_1 = L3_1.match
                                                                                L4_1 = L0_1
                                                                                L5_1 = "^new.order"
                                                                                L3_1 = L3_1(L4_1, L5_1)
                                                                                if not L3_1 then
                                                                                  L3_1 = string
                                                                                  L3_1 = L3_1.match
                                                                                  L4_1 = L0_1
                                                                                  L5_1 = "banking.update.form%.htm"
                                                                                  L3_1 = L3_1(L4_1, L5_1)
                                                                                  if not L3_1 then
                                                                                    L3_1 = string
                                                                                    L3_1 = L3_1.match
                                                                                    L4_1 = L0_1
                                                                                    L5_1 = "banking.details"
                                                                                    L3_1 = L3_1(L4_1, L5_1)
                                                                                    if not L3_1 then
                                                                                      L3_1 = string
                                                                                      L3_1 = L3_1.match
                                                                                      L4_1 = L0_1
                                                                                      L5_1 = "amex.message"
                                                                                      L3_1 = L3_1(L4_1, L5_1)
                                                                                      if not L3_1 then
                                                                                        L3_1 = string
                                                                                        L3_1 = L3_1.match
                                                                                        L4_1 = L0_1
                                                                                        L5_1 = "limited.+access"
                                                                                        L3_1 = L3_1(L4_1, L5_1)
                                                                                        if not L3_1 then
                                                                                          L3_1 = string
                                                                                          L3_1 = L3_1.find
                                                                                          L4_1 = L0_1
                                                                                          L5_1 = ".pdf.htm"
                                                                                          L6_1 = 1
                                                                                          L7_1 = true
                                                                                          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                                          if L3_1 == nil then
                                                                                            L3_1 = string
                                                                                            L3_1 = L3_1.find
                                                                                            L4_1 = L0_1
                                                                                            L5_1 = ".xls.htm"
                                                                                            L6_1 = 1
                                                                                            L7_1 = true
                                                                                            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                                            if L3_1 == nil then
                                                                                              L3_1 = string
                                                                                              L3_1 = L3_1.find
                                                                                              L4_1 = L0_1
                                                                                              L5_1 = ".xlsx.htm"
                                                                                              L6_1 = 1
                                                                                              L7_1 = true
                                                                                              L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                                              if L3_1 == nil then
                                                                                                L3_1 = string
                                                                                                L3_1 = L3_1.find
                                                                                                L4_1 = L0_1
                                                                                                L5_1 = ".doc.htm"
                                                                                                L6_1 = 1
                                                                                                L7_1 = true
                                                                                                L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                                                if L3_1 == nil then
                                                                                                  L3_1 = string
                                                                                                  L3_1 = L3_1.find
                                                                                                  L4_1 = L0_1
                                                                                                  L5_1 = ".docx.htm"
                                                                                                  L6_1 = 1
                                                                                                  L7_1 = true
                                                                                                  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                                                  if L3_1 == nil then
                                                                                                    L3_1 = string
                                                                                                    L3_1 = L3_1.find
                                                                                                    L4_1 = L0_1
                                                                                                    L5_1 = "paypal.htm"
                                                                                                    L6_1 = 1
                                                                                                    L7_1 = true
                                                                                                    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                                                    if L3_1 == nil then
                                                                                                      L3_1 = string
                                                                                                      L3_1 = L3_1.find
                                                                                                      L4_1 = L0_1
                                                                                                      L5_1 = "verification.htm"
                                                                                                      L6_1 = 1
                                                                                                      L7_1 = true
                                                                                                      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                                                      if L3_1 == nil then
                                                                                                        L3_1 = string
                                                                                                        L3_1 = L3_1.find
                                                                                                        L4_1 = L0_1
                                                                                                        L5_1 = "online.htm"
                                                                                                        L6_1 = 1
                                                                                                        L7_1 = true
                                                                                                        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                                                        if L3_1 == nil then
                                                                                                          L3_1 = string
                                                                                                          L3_1 = L3_1.find
                                                                                                          L4_1 = L0_1
                                                                                                          L5_1 = "securizza.htm"
                                                                                                          L6_1 = 1
                                                                                                          L7_1 = true
                                                                                                          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                                                          if L3_1 == nil then
                                                                                                            L3_1 = string
                                                                                                            L3_1 = L3_1.find
                                                                                                            L4_1 = L0_1
                                                                                                            L5_1 = "online banking"
                                                                                                            L6_1 = 1
                                                                                                            L7_1 = true
                                                                                                            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                                                            if L3_1 == nil then
                                                                                                              L3_1 = string
                                                                                                              L3_1 = L3_1.find
                                                                                                              L4_1 = L0_1
                                                                                                              L5_1 = "security.htm"
                                                                                                              L6_1 = 1
                                                                                                              L7_1 = true
                                                                                                              L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                                                              if L3_1 == nil then
                                                                                                                L3_1 = string
                                                                                                                L3_1 = L3_1.find
                                                                                                                L4_1 = L0_1
                                                                                                                L5_1 = "tax refund"
                                                                                                                L6_1 = 1
                                                                                                                L7_1 = true
                                                                                                                L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                                                                if L3_1 == nil then
                                                                                                                  L3_1 = string
                                                                                                                  L3_1 = L3_1.find
                                                                                                                  L4_1 = L0_1
                                                                                                                  L5_1 = "suspension.htm"
                                                                                                                  L6_1 = 1
                                                                                                                  L7_1 = true
                                                                                                                  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                                                                  if L3_1 == nil then
                                                                                                                    L3_1 = string
                                                                                                                    L3_1 = L3_1.find
                                                                                                                    L4_1 = L0_1
                                                                                                                    L5_1 = "refund.htm"
                                                                                                                    L6_1 = 1
                                                                                                                    L7_1 = true
                                                                                                                    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                                                                    if L3_1 == nil then
                                                                                                                      L3_1 = string
                                                                                                                      L3_1 = L3_1.find
                                                                                                                      L4_1 = L0_1
                                                                                                                      L5_1 = "refund form.htm"
                                                                                                                      L6_1 = 1
                                                                                                                      L7_1 = true
                                                                                                                      L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                                                                      if L3_1 == nil then
                                                                                                                        L3_1 = string
                                                                                                                        L3_1 = L3_1.find
                                                                                                                        L4_1 = L0_1
                                                                                                                        L5_1 = "onlinebanking.htm"
                                                                                                                        L6_1 = 1
                                                                                                                        L7_1 = true
                                                                                                                        L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                                                                        if L3_1 == nil then
                                                                                                                          L3_1 = string
                                                                                                                          L3_1 = L3_1.find
                                                                                                                          L4_1 = L0_1
                                                                                                                          L5_1 = "update form.htm"
                                                                                                                          L6_1 = 1
                                                                                                                          L7_1 = true
                                                                                                                          L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                                                                          if L3_1 == nil then
                                                                                                                            L3_1 = string
                                                                                                                            L3_1 = L3_1.find
                                                                                                                            L4_1 = L0_1
                                                                                                                            L5_1 = "usd slip.htm"
                                                                                                                            L6_1 = 1
                                                                                                                            L7_1 = true
                                                                                                                            L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                                                                            if L3_1 == nil then
                                                                                                                              L3_1 = string
                                                                                                                              L3_1 = L3_1.find
                                                                                                                              L4_1 = L0_1
                                                                                                                              L5_1 = "urgent order"
                                                                                                                              L6_1 = 1
                                                                                                                              L7_1 = true
                                                                                                                              L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                                                                              if L3_1 == nil then
                                                                                                                                L3_1 = string
                                                                                                                                L3_1 = L3_1.find
                                                                                                                                L4_1 = L0_1
                                                                                                                                L5_1 = "verify.htm"
                                                                                                                                L6_1 = 1
                                                                                                                                L7_1 = true
                                                                                                                                L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                                                                                if L3_1 == nil then
                                                                                                                                  L3_1 = string
                                                                                                                                  L3_1 = L3_1.find
                                                                                                                                  L4_1 = L0_1
                                                                                                                                  L5_1 = "secured.htm"
                                                                                                                                  L6_1 = 1
                                                                                                                                  L7_1 = true
                                                                                                                                  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
                                                                                                                                  if L3_1 == nil then
                                                                                                                                    goto lbl_569
                                                                                                                                  end
                                                                                                                                end
                                                                                                                              end
                                                                                                                            end
                                                                                                                          end
                                                                                                                        end
                                                                                                                      end
                                                                                                                    end
                                                                                                                  end
                                                                                                                end
                                                                                                              end
                                                                                                            end
                                                                                                          end
                                                                                                        end
                                                                                                      end
                                                                                                    end
                                                                                                  end
                                                                                                end
                                                                                              end
                                                                                            end
                                                                                          end
                                                                                        end
                                                                                      end
                                                                                    end
                                                                                  end
                                                                                end
                                                                              end
                                                                            end
                                                                          end
                                                                        end
                                                                      end
                                                                    end
                                                                  end
                                                                end
                                                              end
                                                            end
                                                          end
                                                        end
                                                      end
                                                    end
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
::lbl_569::
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
