local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.sub
  L2_1 = L0_1
  L3_1 = -3
  L1_1 = L1_1(L2_1, L3_1)
  L2_1 = string
  L2_1 = L2_1.sub
  L3_1 = L0_1
  L4_1 = -4
  L2_1 = L2_1(L3_1, L4_1)
  L4_1 = L0_1
  L3_1 = L0_1.match
  L5_1 = "%->.+/"
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L4_1 = L0_1
    L3_1 = L0_1.match
    L5_1 = "%->.+\\"
    L3_1 = L3_1(L4_1, L5_1)
    if not L3_1 then
      L4_1 = L0_1
      L3_1 = L0_1.match
      L5_1 = "%->.+%->"
      L3_1 = L3_1(L4_1, L5_1)
      if not L3_1 then
        goto lbl_37
      end
    end
  end
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  do return L3_1 end
  ::lbl_37::
  if L1_1 == ".js" or L2_1 == ".jse" or L2_1 == ".vbs" or L2_1 == ".vbe" or L2_1 == ".wsf" then
    L3_1 = 0
    L4_1 = mp
    L4_1 = L4_1.get_mpattributesubstring
    L5_1 = "SCPT:JS/Obfus"
    L4_1 = L4_1(L5_1)
    if not L4_1 then
      L4_1 = mp
      L4_1 = L4_1.get_mpattributesubstring
      L5_1 = "SCPT:TrojanDownloader:JS"
      L4_1 = L4_1(L5_1)
      if not L4_1 then
        L4_1 = mp
        L4_1 = L4_1.get_mpattributesubstring
        L5_1 = "SCPT:Trojan:JS/Obfuse"
        L4_1 = L4_1(L5_1)
        if not L4_1 then
          L4_1 = mp
          L4_1 = L4_1.get_mpattributesubstring
          L5_1 = "SCPT:TrojanDropper:JS/Obfuse"
          L4_1 = L4_1(L5_1)
          if not L4_1 then
            goto lbl_73
          end
        end
      end
    end
    L3_1 = L3_1 + 1
    ::lbl_73::
    L4_1 = mp
    L4_1 = L4_1.get_mpattributesubstring
    L5_1 = "SCPT:Jenxcus"
    L4_1 = L4_1(L5_1)
    if L4_1 then
      L3_1 = L3_1 + 2
    end
    L4_1 = mp
    L4_1 = L4_1.get_mpattributesubstring
    L5_1 = "VBS/Obfus"
    L4_1 = L4_1(L5_1)
    if L4_1 then
      L3_1 = L3_1 + 1
    end
    L4_1 = mp
    L4_1 = L4_1.get_mpattributesubstring
    L5_1 = "SCPT:Kira"
    L4_1 = L4_1(L5_1)
    if not L4_1 then
      L4_1 = mp
      L4_1 = L4_1.get_mpattributesubstring
      L5_1 = "SCPT:JS/HtmlSmuggling"
      L4_1 = L4_1(L5_1)
      if not L4_1 then
        goto lbl_100
      end
    end
    L3_1 = L3_1 + 1
    ::lbl_100::
    L4_1 = mp
    L4_1 = L4_1.get_mpattributesubstring
    L5_1 = "SCPT:Obfusc"
    L4_1 = L4_1(L5_1)
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.get_mpattributesubstring
      L5_1 = "SCPT:Obfuscator.RandomInput"
      L4_1 = L4_1(L5_1)
      if not L4_1 then
        L3_1 = L3_1 + 2
      end
    end
    L4_1 = mp
    L4_1 = L4_1.get_mpattributesubstring
    L5_1 = "SCPT:SimpleAsciiObfuscator"
    L4_1 = L4_1(L5_1)
    if L4_1 then
      L3_1 = L3_1 + 2
    end
    L4_1 = mp
    L4_1 = L4_1.get_mpattributesubstring
    L5_1 = "SWF/Obfuscator"
    L4_1 = L4_1(L5_1)
    if not L4_1 then
      L4_1 = mp
      L4_1 = L4_1.get_mpattributesubstring
      L5_1 = "SCPT:JS/SplitFunc.A"
      L4_1 = L4_1(L5_1)
      if not L4_1 then
        goto lbl_133
      end
    end
    L3_1 = L3_1 + 1
    ::lbl_133::
    L4_1 = mp
    L4_1 = L4_1.get_mpattributesubstring
    L5_1 = "SCPT:charcode.A"
    L4_1 = L4_1(L5_1)
    if not L4_1 then
      L4_1 = mp
      L4_1 = L4_1.get_mpattributesubstring
      L5_1 = "SCPT:JS/StringFromCharCodeCharCodeAt"
      L4_1 = L4_1(L5_1)
      if not L4_1 then
        L4_1 = mp
        L4_1 = L4_1.get_mpattributesubstring
        L5_1 = "SCRIPT:StringFromCharCode.A"
        L4_1 = L4_1(L5_1)
        if not L4_1 then
          goto lbl_152
        end
      end
    end
    L3_1 = L3_1 + 2
    ::lbl_152::
    L4_1 = mp
    L4_1 = L4_1.get_mpattributesubstring
    L5_1 = "VBS/Obfuscator"
    L4_1 = L4_1(L5_1)
    if L4_1 then
      L3_1 = L3_1 + 2
    end
    L4_1 = mp
    L4_1 = L4_1.get_mpattributesubstring
    L5_1 = "SCPT:JS/parseInt"
    L4_1 = L4_1(L5_1)
    if L4_1 then
      L3_1 = L3_1 + 2
    end
    L4_1 = mp
    L4_1 = L4_1.get_mpattributesubstring
    L5_1 = "SCPT:JS/PushShift"
    L4_1 = L4_1(L5_1)
    if L4_1 then
      L3_1 = L3_1 + 2
    end
    L4_1 = mp
    L4_1 = L4_1.get_mpattributesubstring
    L5_1 = "SCPT:Obfuscator.LongVariableName.A"
    L4_1 = L4_1(L5_1)
    if L4_1 then
      L3_1 = L3_1 + 2
    end
    L4_1 = mp
    L4_1 = L4_1.get_mpattributesubstring
    L5_1 = "TrojanDownloader:JS/Donvibs"
    L4_1 = L4_1(L5_1)
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.get_mpattributesubstring
      L5_1 = "TrojanDownloader:JS/Donvibs.EH!atb01"
      L4_1 = L4_1(L5_1)
      if not L4_1 then
        goto lbl_198
      end
    end
    L4_1 = mp
    L4_1 = L4_1.get_mpattributesubstring
    L5_1 = "SCPT:JS/Base64Func.A"
    L4_1 = L4_1(L5_1)
    ::lbl_198::
    if L4_1 then
      L3_1 = L3_1 + 1
    end
    L4_1 = mp
    L4_1 = L4_1.get_mpattributesubstring
    L5_1 = "SCRIPT:TrojanDownloader:JS/Nemucod"
    L4_1 = L4_1(L5_1)
    if not L4_1 then
      L4_1 = mp
      L4_1 = L4_1.get_mpattributesubstring
      L5_1 = "SCPT:JS/Nemucod"
      L4_1 = L4_1(L5_1)
      if not L4_1 then
        L4_1 = mp
        L4_1 = L4_1.get_mpattributesubstring
        L5_1 = "SCPT:JS/Gootkit"
        L4_1 = L4_1(L5_1)
        if not L4_1 then
          goto lbl_218
        end
      end
    end
    L3_1 = L3_1 + 1
    ::lbl_218::
    L4_1 = mp
    L4_1 = L4_1.get_mpattributesubstring
    L5_1 = "TrojanDownloader:HTML/Obfuse"
    L4_1 = L4_1(L5_1)
    if not L4_1 then
      L4_1 = mp
      L4_1 = L4_1.get_mpattributesubstring
      L5_1 = "TrojanDownloader:JS/Obfuse"
      L4_1 = L4_1(L5_1)
      if not L4_1 then
        goto lbl_231
      end
    end
    L3_1 = L3_1 + 1
    ::lbl_231::
    L4_1 = mp
    L4_1 = L4_1.get_mpattributesubstring
    L5_1 = "Scpt:Trojan:JS/GootLoader"
    L4_1 = L4_1(L5_1)
    if not L4_1 then
      L4_1 = mp
      L4_1 = L4_1.get_mpattributesubstring
      L5_1 = "SCPT:TrojanDownloader:O97M/Qakbot"
      L4_1 = L4_1(L5_1)
      if not L4_1 then
        goto lbl_244
      end
    end
    L3_1 = L3_1 + 2
    ::lbl_244::
    L4_1 = mp
    L4_1 = L4_1.get_mpattributesubstring
    L5_1 = "SCPT:Trojan:JS/PikaBot.BX"
    L4_1 = L4_1(L5_1)
    if not L4_1 then
      L4_1 = mp
      L4_1 = L4_1.get_mpattributesubstring
      L5_1 = "SCPT:JS/AsrobfusWscrExec"
      L4_1 = L4_1(L5_1)
      if not L4_1 then
        goto lbl_257
      end
    end
    L3_1 = L3_1 + 1
    ::lbl_257::
    if 6 <= L3_1 then
      L4_1 = mp
      L4_1 = L4_1.set_mpattribute
      L5_1 = "Lua:ObfusJsVbs.D"
      L4_1(L5_1)
    end
    if 3 <= L3_1 then
      L4_1 = mp
      L4_1 = L4_1.set_mpattribute
      L5_1 = "Lua:ObfusJsVbs.C"
      L4_1(L5_1)
    end
    if 4 <= L3_1 then
      L4_1 = mp
      L4_1 = L4_1.INFECTED
      return L4_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
