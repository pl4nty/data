local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.get_mpattributesubstring
L1_1 = "Lua:AmsiAppContextData:File:http"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_PROCESSNAME
L0_1 = L0_1(L1_1)
if L0_1 then
  L2_1 = L0_1
  L1_1 = L0_1.match
  L3_1 = "([^\\]+)$"
  L1_1 = L1_1(L2_1, L3_1)
  L0_1 = L1_1
  if L0_1 then
    L1_1 = string
    L1_1 = L1_1.lower
    L3_1 = L0_1
    L2_1 = L0_1.gsub
    L4_1 = "%s"
    L5_1 = "/x20"
    L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L2_1(L3_1, L4_1, L5_1)
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
    L0_1 = L1_1
    L1_1 = mp
    L1_1 = L1_1.set_mpattribute
    L2_1 = "Lua:AmsiAppContextDataJScriptHttp:Proc:"
    L3_1 = L0_1
    L2_1 = L2_1 .. L3_1
    L1_1(L2_1)
  end
end
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_AMSI_OPERATION_PPID
L1_1 = L1_1(L2_1)
if L1_1 then
  L2_1 = mp
  L2_1 = L2_1.GetParentProcInfo
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 then
    L3_1 = L2_1.image_path
    L5_1 = L3_1
    L4_1 = L3_1.match
    L6_1 = "([^\\]+)$"
    L4_1 = L4_1(L5_1, L6_1)
    L3_1 = L4_1
    if L3_1 then
      L4_1 = string
      L4_1 = L4_1.lower
      L6_1 = L3_1
      L5_1 = L3_1.gsub
      L7_1 = "%s"
      L8_1 = "/x20"
      L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1 = L5_1(L6_1, L7_1, L8_1)
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1)
      L3_1 = L4_1
      L4_1 = mp
      L4_1 = L4_1.set_mpattribute
      L5_1 = "Lua:AmsiAppContextDataJScriptHttp:Parent:"
      L6_1 = L3_1
      L5_1 = L5_1 .. L6_1
      L4_1(L5_1)
    end
  end
end
L2_1 = mp
L2_1 = L2_1.enum_mpattributesubstring
L3_1 = "Lua:AmsiAppContextData:File:http"
L2_1 = L2_1(L3_1)
if L2_1 ~= nil then
  L3_1 = #L2_1
  if L3_1 ~= 0 then
    L3_1 = L2_1[1]
    L4_1 = L3_1
    L3_1 = L3_1.match
    L5_1 = "https?://[%w%.%-]+%.([%w%.]+)/"
    L3_1 = L3_1(L4_1, L5_1)
    if not L3_1 then
      L3_1 = ""
    end
    if L3_1 ~= "" then
      L4_1 = mp
      L4_1 = L4_1.set_mpattribute
      L5_1 = "Lua:AmsiAppContextDataHttp:TLD:"
      L6_1 = string
      L6_1 = L6_1.lower
      L7_1 = L3_1
      L6_1 = L6_1(L7_1)
      L5_1 = L5_1 .. L6_1
      L4_1(L5_1)
      L4_1 = L2_1[1]
      L5_1 = L4_1
      L4_1 = L4_1.match
      L6_1 = "%.([%w]+)$"
      L4_1 = L4_1(L5_1, L6_1)
      if not L4_1 then
        L4_1 = ""
      end
      if L4_1 ~= "" then
        L5_1 = mp
        L5_1 = L5_1.set_mpattribute
        L6_1 = "Lua:AmsiAppContextDataHttp:FileExt:"
        L7_1 = string
        L7_1 = L7_1.lower
        L8_1 = L4_1
        L7_1 = L7_1(L8_1)
        L6_1 = L6_1 .. L7_1
        L5_1(L6_1)
      end
    end
    if L0_1 == "mshta.exe" then
      L4_1 = ipairs
      L5_1 = L2_1
      L4_1, L5_1, L6_1 = L4_1(L5_1)
      for L7_1, L8_1 in L4_1, L5_1, L6_1 do
        L9_1 = string
        L9_1 = L9_1.find
        L10_1 = L8_1
        L11_1 = "%.hta$"
        L9_1 = L9_1(L10_1, L11_1)
        if not L9_1 then
          L9_1 = string
          L9_1 = L9_1.find
          L10_1 = L8_1
          L11_1 = "%.html$"
          L9_1 = L9_1(L10_1, L11_1)
          if not L9_1 then
            L9_1 = mp
            L9_1 = L9_1.set_mpattribute
            L10_1 = "Lua:AmsiAppContextDataJScriptHttpNonHTA"
            L9_1(L10_1)
            break
          end
        end
      end
    end
  end
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
