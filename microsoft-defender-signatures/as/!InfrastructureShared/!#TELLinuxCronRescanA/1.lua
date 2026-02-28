local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_FULL
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 < 10) then
    goto lbl_14
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_14::
L1_1 = {}
L2_1 = "/etc/cron"
L3_1 = "/etc/crontab"
L4_1 = "/var/spool/cron/"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L2_1 = ipairs
L3_1 = L1_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = string
  L7_1 = L7_1.match
  L8_1 = L0_1
  L9_1 = L6_1
  L7_1 = L7_1(L8_1, L9_1)
  if L7_1 then
    L7_1 = tostring
    L8_1 = headerpage
    L7_1 = L7_1(L8_1)
    if L7_1 == nil then
      L8_1 = mp
      L8_1 = L8_1.CLEAN
      return L8_1
    end
    L8_1 = string
    L8_1 = L8_1.gmatch
    L9_1 = L7_1
    L10_1 = "/[^%s]+"
    L8_1, L9_1, L10_1 = L8_1(L9_1, L10_1)
    for L11_1 in L8_1, L9_1, L10_1 do
      L12_1 = sysio
      L12_1 = L12_1.IsFileExists
      L13_1 = L11_1
      L12_1 = L12_1(L13_1)
      if L12_1 then
        L12_1 = mp
        L12_1 = L12_1.ReportLowfi
        L13_1 = L11_1
        L14_1 = 215366885
        L12_1(L13_1, L14_1)
        L12_1 = string
        L12_1 = L12_1.match
        L13_1 = L11_1
        L14_1 = "/%."
        L12_1 = L12_1(L13_1, L14_1)
        if L12_1 then
          L12_1 = mp
          L12_1 = L12_1.ReportLowfi
          L13_1 = L11_1
          L14_1 = 34864475
          L12_1(L13_1, L14_1)
        end
      end
    end
    L8_1 = mp
    L8_1 = L8_1.INFECTED
    return L8_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
