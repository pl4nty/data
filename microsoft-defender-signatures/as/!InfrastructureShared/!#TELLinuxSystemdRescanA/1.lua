local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_FULL
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 < 20) then
    goto lbl_14
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_14::
L1_1 = string
L1_1 = L1_1.match
L2_1 = L0_1
L3_1 = "/etc/systemd/system/([%w%-_]+)%.service"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = tostring
  L2_1 = headerpage
  L1_1 = L1_1(L2_1)
  L3_1 = L1_1
  L2_1 = L1_1.gsub
  L4_1 = "\r\n"
  L5_1 = "\n"
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  L3_1 = L2_1
  L2_1 = L2_1.gsub
  L4_1 = "\r"
  L5_1 = "\n"
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  L1_1 = L2_1
  if L1_1 == nil then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = false
  L3_1 = nil
  L4_1 = string
  L4_1 = L4_1.gmatch
  L5_1 = L1_1
  L6_1 = [[
[^
]+]]
  L4_1, L5_1, L6_1 = L4_1(L5_1, L6_1)
  for L7_1 in L4_1, L5_1, L6_1 do
    L9_1 = L7_1
    L8_1 = L7_1.match
    L10_1 = "^%s*ExecStart%s*=%s*%-?%s*\"?([^\"%s]+)\"?%s*(.*)"
    L8_1, L9_1 = L8_1(L9_1, L10_1)
    _ = L9_1
    L3_1 = L8_1
    if not L3_1 then
      L9_1 = L7_1
      L8_1 = L7_1.match
      L10_1 = "^%s*ExecStartPre%s*=%s*%-?%s*\"?([^\"%s]+)\"?%s*(.*)"
      L8_1, L9_1 = L8_1(L9_1, L10_1)
      _ = L9_1
      L3_1 = L8_1
    end
    if not L3_1 then
      L9_1 = L7_1
      L8_1 = L7_1.match
      L10_1 = "^%s*ExecStartPost%s*=%s*%-?%s*\"?([^\"%s]+)\"?%s*(.*)"
      L8_1, L9_1 = L8_1(L9_1, L10_1)
      _ = L9_1
      L3_1 = L8_1
    end
    if L3_1 then
      L8_1 = sysio
      L8_1 = L8_1.IsFileExists
      L9_1 = L3_1
      L8_1 = L8_1(L9_1)
      if L8_1 then
        L8_1 = mp
        L8_1 = L8_1.ReportLowfi
        L9_1 = L3_1
        L10_1 = 3488067509
        L8_1(L9_1, L10_1)
        L2_1 = true
      end
      L3_1 = nil
    end
  end
  if L2_1 then
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
