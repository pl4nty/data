local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L1_1 = this_sigattrlog
L1_1 = L1_1[3]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = string
  L1_1 = L1_1.lower
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L2_1 = L2_1.utf8p1
  L1_1 = L1_1(L2_1)
  L0_1 = L1_1
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[4]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[4]
    L2_1 = L2_1.utf8p1
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "\\microsoft\\exchange server\\v[1-9][0-9]\\frontend\\"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == nil then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "\\frontend\\httpproxy\\owa\\"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 == nil then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "\\inetpub\\wwwroot\\"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if L1_1 == nil then
        L1_1 = string
        L1_1 = L1_1.find
        L2_1 = L0_1
        L3_1 = "\\microsoft\\exchange server\\v[1-9][0-9]\\clientaccess\\"
        L1_1 = L1_1(L2_1, L3_1)
        if L1_1 == nil then
          goto lbl_88
        end
      end
    end
  end
  L1_1 = IsExchangeServer
  L1_1 = L1_1()
  if L1_1 then
    L1_1 = string
    L1_1 = L1_1.match
    L2_1 = L0_1
    L3_1 = "(.*\\)[^\\]+$"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 then
      L2_1 = bm
      L2_1 = L2_1.trigger_sig
      L3_1 = "TriggerShellPath"
      L4_1 = L1_1
      L2_1(L3_1, L4_1)
    end
    L2_1 = mp
    L2_1 = L2_1.ReportLowfi
    L3_1 = L0_1
    L4_1 = 1067831818
    L2_1(L3_1, L4_1)
    L2_1 = bm
    L2_1 = L2_1.add_related_file
    L3_1 = L0_1
    L2_1(L3_1)
    L2_1 = mp
    L2_1 = L2_1.INFECTED
    return L2_1
  end
end
::lbl_88::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
