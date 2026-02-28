local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
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
  L4_1, L5_1 = L4_1()
  L3_1 = L3_1(L4_1, L5_1)
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
  L3_1 = string
  L3_1 = L3_1.match
  L4_1 = L0_1
  L5_1 = "^confidential"
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L3_1 = string
    L3_1 = L3_1.match
    L4_1 = L0_1
    L5_1 = "^dhl"
    L3_1 = L3_1(L4_1, L5_1)
    if not L3_1 then
      L3_1 = string
      L3_1 = L3_1.match
      L4_1 = L0_1
      L5_1 = "^fidelity"
      L3_1 = L3_1(L4_1, L5_1)
      if not L3_1 then
        L3_1 = string
        L3_1 = L3_1.match
        L4_1 = L0_1
        L5_1 = "^fedex"
        L3_1 = L3_1(L4_1, L5_1)
        if not L3_1 then
          L3_1 = string
          L3_1 = L3_1.match
          L4_1 = L0_1
          L5_1 = "^freemobile"
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
              L5_1 = "^parcel"
              L3_1 = L3_1(L4_1, L5_1)
              if not L3_1 then
                L3_1 = string
                L3_1 = L3_1.match
                L4_1 = L0_1
                L5_1 = "^payment"
                L3_1 = L3_1(L4_1, L5_1)
                if not L3_1 then
                  L3_1 = string
                  L3_1 = L3_1.match
                  L4_1 = L0_1
                  L5_1 = "^po.#"
                  L3_1 = L3_1(L4_1, L5_1)
                  if not L3_1 then
                    L3_1 = string
                    L3_1 = L3_1.match
                    L4_1 = L0_1
                    L5_1 = "^po.+order"
                    L3_1 = L3_1(L4_1, L5_1)
                    if not L3_1 then
                      L3_1 = string
                      L3_1 = L3_1.match
                      L4_1 = L0_1
                      L5_1 = "^po%d%d%d%d"
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
                          L5_1 = "^quotation"
                          L3_1 = L3_1(L4_1, L5_1)
                          if not L3_1 then
                            L3_1 = string
                            L3_1 = L3_1.match
                            L4_1 = L0_1
                            L5_1 = "^%d%d%d%d%d%d%d.pdf"
                            L3_1 = L3_1(L4_1, L5_1)
                            if not L3_1 then
                              L3_1 = string
                              L3_1 = L3_1.match
                              L4_1 = L0_1
                              L5_1 = "^document.%d+"
                              L3_1 = L3_1(L4_1, L5_1)
                              if not L3_1 then
                                L3_1 = string
                                L3_1 = L3_1.match
                                L4_1 = L0_1
                                L5_1 = "^shipment"
                                L3_1 = L3_1(L4_1, L5_1)
                                if not L3_1 then
                                  L3_1 = string
                                  L3_1 = L3_1.match
                                  L4_1 = L0_1
                                  L5_1 = "pending.+deposit"
                                  L3_1 = L3_1(L4_1, L5_1)
                                  if not L3_1 then
                                    L3_1 = string
                                    L3_1 = L3_1.match
                                    L4_1 = L0_1
                                    L5_1 = "mailbox.maintenance"
                                    L3_1 = L3_1(L4_1, L5_1)
                                    if not L3_1 then
                                      L3_1 = string
                                      L3_1 = L3_1.match
                                      L4_1 = L0_1
                                      L5_1 = "account.safety"
                                      L3_1 = L3_1(L4_1, L5_1)
                                      if not L3_1 then
                                        L3_1 = string
                                        L3_1 = L3_1.match
                                        L4_1 = L0_1
                                        L5_1 = "acct.review"
                                        L3_1 = L3_1(L4_1, L5_1)
                                        if not L3_1 then
                                          L3_1 = string
                                          L3_1 = L3_1.match
                                          L4_1 = L0_1
                                          L5_1 = "delivery.details"
                                          L3_1 = L3_1(L4_1, L5_1)
                                          if not L3_1 then
                                            L3_1 = string
                                            L3_1 = L3_1.match
                                            L4_1 = L0_1
                                            L5_1 = "important.update"
                                            L3_1 = L3_1(L4_1, L5_1)
                                            if not L3_1 then
                                              L3_1 = string
                                              L3_1 = L3_1.match
                                              L4_1 = L0_1
                                              L5_1 = "security.+mail"
                                              L3_1 = L3_1(L4_1, L5_1)
                                              if not L3_1 then
                                                L3_1 = string
                                                L3_1 = L3_1.match
                                                L4_1 = L0_1
                                                L5_1 = "bank.transaction"
                                                L3_1 = L3_1(L4_1, L5_1)
                                                if not L3_1 then
                                                  L3_1 = string
                                                  L3_1 = L3_1.match
                                                  L4_1 = L0_1
                                                  L5_1 = "account.verification"
                                                  L3_1 = L3_1(L4_1, L5_1)
                                                  if not L3_1 then
                                                    L3_1 = string
                                                    L3_1 = L3_1.match
                                                    L4_1 = L0_1
                                                    L5_1 = "money.transfer"
                                                    L3_1 = L3_1(L4_1, L5_1)
                                                    if not L3_1 then
                                                      L3_1 = string
                                                      L3_1 = L3_1.match
                                                      L4_1 = L0_1
                                                      L5_1 = "money.+confirmation"
                                                      L3_1 = L3_1(L4_1, L5_1)
                                                      if not L3_1 then
                                                        L3_1 = string
                                                        L3_1 = L3_1.match
                                                        L4_1 = L0_1
                                                        L5_1 = "new.order"
                                                        L3_1 = L3_1(L4_1, L5_1)
                                                        if not L3_1 then
                                                          L3_1 = string
                                                          L3_1 = L3_1.match
                                                          L4_1 = L0_1
                                                          L5_1 = "notification.letter"
                                                          L3_1 = L3_1(L4_1, L5_1)
                                                          if not L3_1 then
                                                            L3_1 = string
                                                            L3_1 = L3_1.match
                                                            L4_1 = L0_1
                                                            L5_1 = "violation.message"
                                                            L3_1 = L3_1(L4_1, L5_1)
                                                            if not L3_1 then
                                                              L3_1 = string
                                                              L3_1 = L3_1.match
                                                              L4_1 = L0_1
                                                              L5_1 = "transfer.instruction"
                                                              L3_1 = L3_1(L4_1, L5_1)
                                                              if not L3_1 then
                                                                L3_1 = string
                                                                L3_1 = L3_1.match
                                                                L4_1 = L0_1
                                                                L5_1 = "doc.pdf"
                                                                L3_1 = L3_1(L4_1, L5_1)
                                                                if not L3_1 then
                                                                  L3_1 = string
                                                                  L3_1 = L3_1.match
                                                                  L4_1 = L0_1
                                                                  L5_1 = "new.message"
                                                                  L3_1 = L3_1(L4_1, L5_1)
                                                                  if not L3_1 then
                                                                    L3_1 = string
                                                                    L3_1 = L3_1.match
                                                                    L4_1 = L0_1
                                                                    L5_1 = "new.purchase"
                                                                    L3_1 = L3_1(L4_1, L5_1)
                                                                    if not L3_1 then
                                                                      goto lbl_281
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
::lbl_281::
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
