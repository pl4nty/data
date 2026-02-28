local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1)
L1_1 = string
L1_1 = L1_1.sub
L2_1 = L0_1
L3_1 = -4
L1_1 = L1_1(L2_1, L3_1)
L2_1 = string
L2_1 = L2_1.sub
L3_1 = L0_1
L4_1 = -5
L2_1 = L2_1(L3_1, L4_1)
if L1_1 ~= ".exe" and L1_1 ~= ".tmp" and L2_1 ~= ".html" and L1_1 ~= ".hta" then
  L4_1 = L0_1
  L3_1 = L0_1.find
  L5_1 = "availabilitytest"
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if not L3_1 then
    L4_1 = L0_1
    L3_1 = L0_1.find
    L5_1 = "mxescr"
    L6_1 = 1
    L7_1 = true
    L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
    if not L3_1 then
      goto lbl_42
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_42::
if L0_1 ~= nil then
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
        goto lbl_62
      end
    end
  end
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  do return L3_1 end
  ::lbl_62::
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
          goto lbl_88
        end
      end
    end
  end
  L3_1 = L3_1 + 1
  ::lbl_88::
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
      goto lbl_115
    end
  end
  L3_1 = L3_1 + 1
  ::lbl_115::
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
  if L4_1 then
    L3_1 = L3_1 + 1
  end
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
        goto lbl_161
      end
    end
  end
  L3_1 = L3_1 + 2
  ::lbl_161::
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
      goto lbl_207
    end
  end
  L4_1 = mp
  L4_1 = L4_1.get_mpattributesubstring
  L5_1 = "SCPT:JS/Base64Func.A"
  L4_1 = L4_1(L5_1)
  ::lbl_207::
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
        goto lbl_227
      end
    end
  end
  L3_1 = L3_1 + 1
  ::lbl_227::
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
      goto lbl_240
    end
  end
  L3_1 = L3_1 + 1
  ::lbl_240::
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
      goto lbl_253
    end
  end
  L3_1 = L3_1 + 2
  ::lbl_253::
  if 5 <= L3_1 then
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
